import 'package:flutter/material.dart';

import 'Amount/AddingAmount.dart';
import 'Amount/Report.dart';
import 'Calculate/user/user_calculate.dart';
import 'HealthAssistant.dart';
import 'firstpage.dart';

class MenuHome extends StatelessWidget {
  final menu = [
    'Calculate\n the amount of water',
    'Adding Amount',
    'Report',
    'Air Quality ',
  ];
  final box_color = [
    0xff465EA6,
    0xff79C7FF,
    0xff8DAEF2,
    0xff38B6FF,
  ];

  final icon_menu = [
    'image/icon_menu/hydrometer.png',
    'image/icon_menu/hydration.png',
    'image/icon_menu/report.png',
    'image/icon_menu/aiq.png',
  ];

  final fn = [
    CalculateRoute(),
    AddAmoutPage(),
    ListAmount(),
    // HealthAssistant(),
    AQIPage(),
  ];

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
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => MenuHome()));
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Menu',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff465EA6),
                fontSize: 35,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Container(),
            itemCount: menu.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                height: MediaQuery.of(context).size.height * 0.2,
                child: GestureDetector(
                  onTap: () {
                    // function to execute on tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => fn[index]),
                    );
                  },
                  child: Card(
                    color: Color(box_color[index]),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Image.asset(icon_menu[index]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            menu[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Poppins',
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
