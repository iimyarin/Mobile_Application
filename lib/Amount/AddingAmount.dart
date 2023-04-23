import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../menu.dart';
import '../model/user.dart';
import 'Report.dart';

class AddAmoutPage extends StatefulWidget {
  @override
  _AddAmoutPage createState() => _AddAmoutPage();
}

class _AddAmoutPage extends State<AddAmoutPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();

  User userinfo = User(amount: '0', email: '', name: '');

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _dataCollection =
      FirebaseFirestore.instance.collection('amountdata');

  // String _amount = "0.0";
  String _selectedTime = '';
  String _selectetDate = '';
  // DateTime _dateTime = DateTime.now();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4B60A3),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => MenuHome()));
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: 0.85,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Container(
                              // color: Colors.yellow,
                              child: Text(
                                'Adding Amount',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color(0xff465EA6),
                                  fontSize: 35,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("Date"),
                                Container(
                                    width: 150,
                                    height: 40,
                                    padding: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5,
                                            color: Color(0xffBFBEBE)),
                                        color: Colors.grey.shade600,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: DateTimePicker(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                      type: DateTimePickerType.date,
                                      dateMask: 'd/MM/yyyy',
                                      initialValue: DateTime.now().toString(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2100),
                                      onChanged: (val) {
                                        setState(() {
                                          _selectetDate = val;
                                        });
                                      },
                                    )),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text("Time"),
                                Container(
                                    width: 150,
                                    height: 40,
                                    padding: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5,
                                            color: Color(0xffBFBEBE)),
                                        color: Colors.grey.shade600,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: DateTimePicker(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                      type: DateTimePickerType.time,
                                      initialValue: DateFormat("HH:mm")
                                          .format(DateTime.now()),
                                      onChanged: (val) {
                                        setState(() {
                                          _selectedTime = val;
                                        });
                                      },
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset('image/AddingAmount/water1.png'),
                            iconSize: 100,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset('image/AddingAmount/water2.png'),
                            iconSize: 100,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset('image/AddingAmount/water3.png'),
                            iconSize: 100,
                            onPressed: () {},
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset('image/AddingAmount/water4.png'),
                            iconSize: 100,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset('image/AddingAmount/water5.png'),
                            iconSize: 100,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset('image/AddingAmount/water6.png'),
                            iconSize: 100,
                            onPressed: () {},
                          )
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 60.0),
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                height: 50,
                                child: TextFormField(
                                  controller: _controller,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    // labelText: 'Add',
                                    hintText: 'more',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            color: Color(0xff004AAD))),
                                    prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                    ),
                                  ),
                                  onSaved: (String? amount) {
                                    userinfo.amount = amount!;
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  await _dataCollection.add({
                                    'Amount': userinfo.amount,
                                    'Date': _selectetDate,
                                    'Time': _selectedTime,
                                  });
                                  print('${userinfo.amount}');
                                  print('${_selectetDate}');
                                  print('${_selectedTime}');
                                  _formKey.currentState?.reset();
                                  _controller.clear();
                                  setState(() {
                                    _selectetDate = '';
                                    _selectedTime = '';
                                  });
                                  _formKey.currentState?.reset();
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListAmount()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      EdgeInsets.fromLTRB(125, 10, 125, 10),
                                  primary: Color(0xff4B60A3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              child: Text('Add',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
