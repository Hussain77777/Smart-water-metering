import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'backgnd.dart';
import 'huuilogin.dart';
class huuiforget extends StatefulWidget {
  @override
  _huuiforgetState createState() => _huuiforgetState();
}

class _huuiforgetState extends State< huuiforget> {
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

  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: backgnd(child:isconnected? Column(mainAxisAlignment:MainAxisAlignment.center,

        children: [ SingleChildScrollView
          (
          child: Stack(children: [
            Container(
              alignment: Alignment.centerLeft,padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
              child: Text("Forget Password",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF2661FA),fontSize: 30),textAlign: TextAlign.left,),
            ),
            SizedBox(height: size.height*0.5,),
Container(
  alignment: Alignment.center,margin: EdgeInsets.symmetric(horizontal: 40),
  child: Form(
key: _formKey,child:
    Column(

      children: [ SizedBox(height: 100,),
        Container(

          child: TextFormField(
            style: TextStyle(color: Colors.black),
            controller: emailController,
            validator: (String value){
              if(value.isEmpty){
                return "Email Can not be empty";
              }if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9,-]+.[a-z]").hasMatch(value)) {
                return "please enter a valid email";
              }
              else{
                return null;
              }
            },
            decoration: InputDecoration( prefix:Icon(FontAwesomeIcons.solidEnvelope,color: Colors.blue,size:20),
                border: const UnderlineInputBorder(),
                labelText: "Email",labelStyle:
                TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        SizedBox(height:size.height*0.01),
        SizedBox(height: 15.0),
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.blue
            ),

            alignment: Alignment.center,
            child: Text("Get ResetPassword Link",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
          onTap: (){
            restPass();
          },
        ),
        SizedBox(height: 20.0),
      ],

    ),

),
)


          ],),
        )

      ],):Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [//SizedBox(height:100),

      Icon(Icons.wifi_off,size:50,color: Colors.red,),
      Text("Please make sure you have an Active internet Connection",style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
      ],
    )),
    );
  }
  void restPass() async{
    if(_formKey.currentState.validate()){
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text).then((value){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> huuilogin()));
        Fluttertoast.showToast(
            msg: "Link Sent Successfully ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }
}




