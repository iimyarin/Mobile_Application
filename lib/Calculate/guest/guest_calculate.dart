import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../firstpage.dart';
import 'guest_output_calculate.dart';

class GCalculateRoute extends StatefulWidget {
  @override
  _GCalculateRoute createState() => _GCalculateRoute();
}

class _GCalculateRoute extends State<GCalculateRoute> {
  // const CalculateRoute({super.key});
  int weight = 0;
  TextEditingController weightController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            left: 0.1,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              },
              icon: Icon(Icons.arrow_back_ios),
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
                          builder: (context) => GCalculateWater(
                              result: double.parse(weightController.text) *
                                  2.2 *
                                  30 /
                                  2),
                        ),
                      );
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
