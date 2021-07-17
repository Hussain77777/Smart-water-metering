import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../homescreen.dart';

import 'backgnd.dart';
import 'huuiforget.dart';
import 'huuisignup.dart';

class huuilogin extends StatefulWidget {
  @override
  _huuiloginState createState() => _huuiloginState();
}

class _huuiloginState extends State<huuilogin> {
  bool isconnected = false;

  void initState() {
    emailController.addListener(onListen);
    super.initState();
  }

  void dispose() {
    super.dispose();
    emailController.removeListener(onListen);
    emailController.dispose();

    //super.dispose();
  }

  bool _secureText = true;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onListen() => setState(() {});
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: backgnd(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA),
                        fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.5,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: emailController,
                          validator: (emailController) =>
                              emailController != null &&
                                      !EmailValidator.validate(emailController)
                                  ? 'Enter a valid email'
                                  : null,
                          decoration: InputDecoration(
                              prefix: Icon(FontAwesomeIcons.solidEnvelope,
                                  color: Colors.blue, size: 20),
                              border: const UnderlineInputBorder(),
                              suffixIcon: emailController.text.isEmpty
                                  ? Container(
                                      width: 0,
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () => emailController.clear(),
                                    ),
                              //    hintText: "Email",
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: passwordController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Password can not be empty";
                            }
                            if (value.length < 7) {
                              return "Password should be grater than 6 char";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(_secureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },
                              ),
                              border: const UnderlineInputBorder(),
                              prefix: Icon(FontAwesomeIcons.key,
                                  color: Colors.blue, size: 20),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          obscureText: _secureText,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      InkWell(
                        child: Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 12, color: Color(0XFF2661FA)),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => huuiforget()));
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.blue),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () {
                            login();
                          }),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(width: 5.0),
                            InkWell(
                                child: Text(
                                  'SignUp',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => huuisignup()));
                                }),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  void login() async {
    try {
      if (_formKey.currentState.validate()) {
        setState(() {
          isLoading = true;
        });
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((user) {
          setState(() {
            isLoading = false;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false);
          Fluttertoast.showToast(
              msg: "Welcome Back $emailController.text",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e.toString());
      Fluttertoast.showToast(
          msg: "Credentials are not match.Try Again!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
