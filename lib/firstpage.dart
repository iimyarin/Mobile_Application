import 'package:flutter/material.dart';
import 'Calculate/guest/guest_calculate.dart';
import 'login.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Text('Stay hydrated with ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff465EA6),
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              child: Text('WEHYDRATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff8DAEF2),
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
            ),
            Column(children: <Widget>[
              Image.asset('image/open_app.png'),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  child: const Text("Let's Start",
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 11)),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Color(0xff366CD9),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GCalculateRoute()),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 150,
                child: OutlinedButton(
                  child: const Text('Login',
                      style: TextStyle(
                          color: Color(0xff366CD9),
                          fontFamily: 'Poppins',
                          fontSize: 11)),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(width: 2, color: Color(0xff366CD9)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              )
              // OutlinedButton(onPressed: () {}, child: Text("Login")),
            ])
          ],
        ),
      ),
    );
  }
}
