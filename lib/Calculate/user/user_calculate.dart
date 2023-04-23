import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../menu.dart';
import 'output_calculate.dart';

class CalculateRoute extends StatefulWidget {
  @override
  _CalculateRoute createState() => _CalculateRoute();
}

class _CalculateRoute extends State<CalculateRoute> {
  // const CalculateRoute({super.key});
  int weight = 0;
  TextEditingController weightController = new TextEditingController();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _goalCollection =
      FirebaseFirestore.instance.collection('goal');

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: firebase,
    //     builder: (context,snapshot){
    //       if(snapshot.hasError) {
    //         return Scaffold(
    //             appBar: AppBar(
    //               title: Text("error"),
    //             ),
    //             body: Center(child: Text('${snapshot.error}'),),
    //           );
    //       }else{
    //         return Scaffold(
    //       appBar: AppBar(
    //         title: Text("Success"),
    //       ),
    //       body: Center(
    //         child: Text('Data added successfully!'),
    //       ),
    //     );
    //       }
    //     }
    // );
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            right: 0.1,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuHome()));
              },
              icon: Icon(Icons.menu),
              iconSize: 30,
              color: Color(0xffC1C1C1),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 400,
                child: Text(
                  'Enter your',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff465EA6),
                    fontSize: 55,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 400,
                child: Text(
                  'weight',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xff465EA6),
                    fontSize: 55,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // color: Color(0xff366CD9),
              ),
              Container(
                width: 400,
                child: Text(
                  ' to calculate daily water intake.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xffC1C1C1),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                // color: Color(0xff366CD9),
              ),
              Container(
                height: 200,
                width: 400,
                // color: Color(0xff366CD9),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: weightController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffC1C1C1)),
                        ),
                        labelText: 'weight (Kg.)',
                        labelStyle: TextStyle(
                          color: Color(0xffC1C1C1), // set the color here
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff465EA6), // specify the background color
                  ),
                  child: const Text("Calculate",
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
                  onPressed: () {
                    if (weightController.text.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CalculateWater(
                              result: double.parse(weightController.text) *
                                  2.2 *
                                  30 /
                                  2),
                        ),
                      );
                      _goalCollection.add({
                        'goal':
                            double.parse(weightController.text) * 2.2 * 30 / 2,
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
