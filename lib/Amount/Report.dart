import 'package:flutter/material.dart';
import '../menu.dart';
import 'AddingAmount.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class ListAmount extends StatefulWidget {
  @override
  _ListAmount createState() => _ListAmount();
}

class _ListAmount extends State<ListAmount> {
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
          title: Text('Report',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff465EA6),
                  fontSize: 35,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("amountdata").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Stack(
              children: [
                Container(
                  // color: Colors.white,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'image/listamount.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                ListView(
                  children: snapshot.data!.docs.map((document) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 24.0),
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        // elevation: 8,
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 25),
                              child: Container(
                                child: CircleAvatar(
                                  radius: 40.0,
                                  backgroundColor: Color(0xff79C7FF),
                                  child: Icon(
                                    Icons.local_drink,
                                    color: Colors.white,
                                    size: 45.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 150.0, top: 40),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'Total',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 100.0),
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              document["Amount"],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            document["Date"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25),
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              document["Time"],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ));
  }
}
