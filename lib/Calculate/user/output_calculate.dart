import 'package:flutter/material.dart';
import '../../menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CalculateWater extends StatelessWidget {
  double result = 0;

  CalculateWater({
    super.key,
    required this.result,
  });
  // final double result = 0;
  // CalculateWater({Key key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    height: 100,
                    child: Text(
                      'The adequate amount of water for your body',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff465EA6),
                        fontSize: 30,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'image/output_page.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 30,
                          bottom: 0,
                          left: 10,
                          right: 0,
                          child: Center(
                            child: Text(result.toStringAsFixed(2),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 54,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: Text(
                    ' milliliter',
                    style: TextStyle(
                      color: Color(0xff465EA6),
                      fontFamily: 'Poppins',
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          Color(0xff465EA6), // specify the background color
                    ),
                    child: const Text("OK",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuHome()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
