import 'package:flutter/material.dart';
import 'firstpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      User? user = await loginUsingEmailPassword(
        email: email,
        password: password,
        context: context,
      );

      setState(() {
        _isLoading = false;
      });

      if (user != null) {
        // Navigate to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MenuHome()),
        );
      }
    }
  }

  static Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for this email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("No user found for this email."),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        print("Error: ${e.message}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: ${e.message}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                // color: Colors.white,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'image/login.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                width: 700,
                height: 220,
                // color: Colors.grey,
                child: Stack(
                  children: [
                    Positioned(
                      top: 80,
                      left: 40,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          // Do something when the arrow back button is pressed
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage()));
                        },
                        color: Colors.white,
                        iconSize: 35.0,
                      ),
                    ),
                    Positioned(
                      top: 150,
                      left: 90,
                      child: Text('Login',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              )
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(40.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color(0xff004AAD))),
                    ),
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (input) => _emailController.text = input!,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(40.0),
                      child: TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Color(0xff004AAD)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.lock),
                          ),
                        ),
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (input) => _passwordController.text = input!,
                      ),
                    ),
                    SizedBox(
                      width: 325,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:
                              Color(0xff004AAD), // specify the background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // set border radius
                          ),
                        ),
                        child: const Text("Login",
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 20)),
                        onPressed: _isLoading ? null : _submit,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
