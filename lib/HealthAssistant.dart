import 'package:flutter/material.dart';

import 'menu.dart';

class HealthAssistant extends StatelessWidget {
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
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('(o^^)o',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff465EA6),
                          fontSize: 40,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: Text('see you soon!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff465EA6),
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ],
        ));
  }
}
