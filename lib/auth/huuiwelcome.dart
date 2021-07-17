import 'dart:async';

import 'package:firebase_database/ui/utils/stream_subscriber_mixin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity/connectivity.dart';
import 'backgnd.dart';
import 'huuilogin.dart';
import 'huuisignup.dart';
class huuiwelcome extends StatefulWidget {
  @override
  _huuiwelcomeState createState() => _huuiwelcomeState();
}

class _huuiwelcomeState extends State<huuiwelcome> {
  StreamSubscription subscription;
  bool isconnected=false;
void initState(){

  super.initState();
  subscription=Connectivity().onConnectivityChanged.listen((result){
   setState(() {
     isconnected=(result!=ConnectivityResult.none);
   });


  });

}
void dispose(){
  subscription.cancel();
  super.dispose();
}

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Water',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: 'Metering',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
             // text: 'rnz',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ]),
    );
  }
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => huuilogin()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => huuisignup()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(body:

    backgnd(child:
    Column(

    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    _title(),
    SizedBox(
    height: 80,
    ),
    _submitButton(),
    SizedBox(
    height: 20,
    ),
    _signUpButton(),
    SizedBox(
    height: 20,
    ),
    ],),
    //);

    //}
       // else{return
    //Icon(Icons.wifi_off,size:30),
  //  );
//
   // }
   // }

    )
    //),

    );
  }
}
