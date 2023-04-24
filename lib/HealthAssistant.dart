// import 'package:flutter/material.dart';

// import 'menu.dart';

// class HealthAssistant extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: Padding(
//             padding: const EdgeInsets.only(left: 30.0),
//             child: IconButton(
//               icon: Icon(Icons.arrow_back_ios),
//               iconSize: 30,
//               color: Color(0xff465EA6),
//               onPressed: () {
//                 Navigator.pop(context,
//                     MaterialPageRoute(builder: (context) => MenuHome()));
//               },
//             ),
//           ),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   child: Text('(o^^)o',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Color(0xff465EA6),
//                           fontSize: 40,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.bold)),
//                 ),
//                 Container(
//                   child: Text('see you soon!',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Color(0xff465EA6),
//                           fontSize: 22,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.bold)),
//                 )
//               ],
//             ),
//           ],
//         ));
//   }
// }

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class AQIData {
//   final int aqi;
//   final String city;
//   final String time;

//   AQIData({required this.aqi, required this.city, required this.time});

//   factory AQIData.fromJson(Map<String, dynamic> json) {
//     return AQIData(
//       aqi: json['data']['aqi'],
//       city: json['data']['city']['name'],
//       time: json['data']['time']['s'],
//     );
//   }
// }

// Future<AQIData> fetchAQIData(String location) async {
//   final response = await http.get(Uri.parse(
//       'https://api.waqi.info/feed/$location/?token=8723cbf05b034637dbc3c8d4be39be6e9b65da31'));

//   if (response.statusCode == 200) {
//     return AQIData.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load AQI data');
//   }
// }

// class AQIScreen extends StatelessWidget {
//   final String location;

//   const AQIScreen({Key? key, required this.location}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<AQIData>(
//       future: fetchAQIData(location),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('AQI for ${snapshot.data!.city}'),
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'AQI: ${snapshot.data!.aqi}',
//                     style: TextStyle(fontSize: 24),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Last updated: ${snapshot.data!.time}',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Error'),
//             ),
//             body: Center(
//               child: Text('Failed to load AQI data'),
//             ),
//           );
//         } else {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Loading'),
//             ),
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     title: 'AQI Demo',
//     home: AQIScreen(location: 'paris'),
//   ));
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'menu.dart';

class AQIData {
  final int aqi;
  final String city;
  final String time;

  AQIData({required this.aqi, required this.city, required this.time});

  factory AQIData.fromJson(Map<String, dynamic> json) {
    return AQIData(
      aqi: json['data']['aqi'],
      city: json['data']['city']['name'],
      time: json['data']['time']['s'],
    );
  }
}

class AQIPage extends StatefulWidget {
  const AQIPage({Key? key}) : super(key: key);

  @override
  _AQIPageState createState() => _AQIPageState();
}

class _AQIPageState extends State<AQIPage> {
  final _locationController = TextEditingController();
  String _result = '';
  String _resultAqi = '';
  String _resultCity = '';
  String _resultTime = '';

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  Future<AQIData> _fetchAQIData(String location) async {
    final response = await http.get(Uri.parse(
        'https://api.waqi.info/feed/$location/?token=8723cbf05b034637dbc3c8d4be39be6e9b65da31'));

    if (response.statusCode == 200) {
      return AQIData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load AQI data');
    }
  }

  void _handleSearch() async {
    try {
      AQIData aqiData = await _fetchAQIData(_locationController.text);
      setState(() {
        _result = 'AQI for ${aqiData.city}: ${aqiData.aqi} at ${aqiData.time}';
        _resultCity = '${aqiData.city}';
        _resultAqi = '${aqiData.aqi}';
        _resultTime = '${aqiData.time}';

        print('${aqiData.aqi}');
        _locationController.clear();
      });
    } catch (e) {
      setState(() {
        _result = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 30,
              color: Color(0xff465EA6),
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => MenuHome()));
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Text('Menu',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //         color: Color(0xff465EA6),
          //         fontSize: 35,
          //         fontFamily: 'Poppins',
          //         fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            Container(
              // color: Colors.blue,
              child: Text('Check Your Location',
                  style: const TextStyle(
                      color: Color(0xff465EA6),
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              // color: Colors.blue,
              height: 50,
              margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
              child: TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: 'Enter your Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: Color(0xff004AAD)),
                  ),
                  suffixIcon: IconButton(
                    onPressed: _handleSearch,
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                child: Text('AQI',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color(0xff465EA6),
                        fontSize: 35,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              child: Text('${_resultCity}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xff465EA6),
                      fontSize: 50,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Container(
                    // color: Colors.white,
                    width: 300,
                    height: 200,
                    // color: Colors.blue,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'image/air-quality.png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    bottom: 0,
                    left: 10,
                    right: 0,
                    child: Center(
                      child: Text('${_resultAqi}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text('${_resultTime}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xff465EA6),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
            )
          ],
        ));
  }
}
