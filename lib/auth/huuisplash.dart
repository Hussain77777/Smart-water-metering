import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../homescreen.dart';
import 'huuisignup.dart';


class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}
class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), (){
      FirebaseAuth.instance.authStateChanges().listen((user){
        if(user==null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> huuisignup()));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));

        };
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/(conflicting copy) Blue Waves Pattern Plumbing Business Card.png'),
                fit: BoxFit.cover,
              )
          ),
          child: SpinKitFadingCircle(color: Colors.pinkAccent[400],size: 60.0,),
        )
    );
  }
}

