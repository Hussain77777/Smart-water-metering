//import './signupppppp.dart';
import 'package:email_auth/email_auth.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'forget.dart';
//import 'homescreen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../homescreen.dart';

import 'package:warerusagekash/models/model.dart';




import 'backgnd.dart';
import 'huuilogin.dart';

class huuisignup extends StatefulWidget {
  @override
  _huuisignupState createState() => _huuisignupState();
}

class _huuisignupState extends State<huuisignup> {
  @override
  currentUser() {
    final User user = FirebaseAuth.instance.currentUser;
    final uid = user.uid.toString();
    return uid;
  }
  bool _secureText = true;
  bool isLoading = false;

  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController flatnoController = TextEditingController();
  @override
  bool value=false;
  final ref =FirebaseDatabase.instance.reference();
  onUpdate(){
    setState(() {
      value=!value;
    });
  }
  StreamSubscription subscription;
  bool isconnected=false;
  void initState(){
    emailController.addListener(onListen);
    phoneController.addListener(onListen);
    flatnoController.addListener(onListen);
    addressController.addListener(onListen);
    pincodeController.addListener(onListen);
usernameController.addListener(onListen);
    super.initState();
    subscription=Connectivity().onConnectivityChanged.listen((result){
      setState(() {
        isconnected=(result!=ConnectivityResult.none);
      });


    });

  }
  void dispose(){
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    flatnoController.dispose();

    subscription.cancel();
    super.dispose();
    usernameController.dispose();
    emailController.removeListener(onListen);
    phoneController.removeListener(onListen);
    addressController.removeListener(onListen);
    pincodeController.removeListener(onListen);
    flatnoController.removeListener(onListen);
    usernameController.removeListener(onListen);
  }
  void sendOTP()async{
    EmailAuth.sessionName = "Water metering";
var res =await EmailAuth.sendOtp(receiverMail: emailController.text);
if (res){print("OTP sent");


}
else {
  print("We could not sent the OTP");
}}
  void verifyOTP()async{
    var res=EmailAuth.validate(receiverMail: emailController.text, userOTP: otpController.text);
    if (res){print("OTP Verified");


    }
    else {
      print("Invalid OTP");
    }}
  void onListen()=>setState((){});
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(body: backgnd(child://StreamBuilder( stream:Connectivity().onConnectivityChanged,
   // builder:(BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot
    //){
   // if(snapshot!=null&&snapshot.hasData&&snapshot.data!=ConnectivityResult.none){ return
    ListView( //physics: NeverScrollableScrollPhysics(),//scrollDirection: Axis.vertical,
      children:<Widget> [
        SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
                child: Text("REGISTER",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF2661FA),fontSize: 30),textAlign: TextAlign.left,),
              ),
              SizedBox(height: size.height*0.005,),

                Container(alignment: Alignment.center,margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Form(key:_formKey,

                    child: Column(
                        children:[ SizedBox(height: 90,),

                          Container(

                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: usernameController,
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'UserName can not be empty';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  prefix:Icon(FontAwesomeIcons.solidEnvelope,color: Colors.blue,size:20),
                                  border: const UnderlineInputBorder(),
                                  suffixIcon:usernameController.text.isEmpty?Container(width: 0,): IconButton(
                                    icon:Icon(Icons.close),
                                    onPressed: ()=>usernameController.clear(),
                                  ),
                                  labelText: "Username",labelStyle:
                                  TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),SizedBox(height:size.height*0.005),
                          Container(

                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: phoneController,
                              validator: (String value){
                                if(value.isEmpty){
                                  return "PhoneNumber can not be empty";
                                }if(value.length>12||value.length<11 )
                                {
                                return "Enter valid phone number";
                              }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  prefix: Icon(FontAwesomeIcons.mobile,color: Colors.blueAccent,size:20),
                                  suffixIcon:phoneController.text.isEmpty?Container(width: 0,): IconButton(
                                    icon:Icon(Icons.close),
                                    onPressed: ()=>phoneController.clear(),
                                  ),
                                  border: const UnderlineInputBorder(),
                                  labelText: 'PhoneNumber',labelStyle:
                              TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(height:size.height*0.005),
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
                                suffixIcon:TextButton(child: Text ("Send OTP"),
                            onPressed: (){sendOTP();
                            }
                              ),
                                  labelText: "Email",labelStyle:
                                  TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          SizedBox(height:size.height*0.005),
                          Container(

                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: otpController,
                              validator: (String value){
                                if(value.isEmpty){
                                  return "OTP Can not be empty";
                                }

                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration( prefix:Icon(FontAwesomeIcons.solidEnvelope,color: Colors.blue,size:20),
                                  border: const UnderlineInputBorder(),
                                  suffixIcon:TextButton(child: Text ("Verify  OTP"),
                                    onPressed: () {
                                      verifyOTP();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar
                                        (content: Text("OTP verified")),);
                                       //   : ScaffoldMessenger.of(context)
                                       //   .showSnackBar(SnackBar
                                     //   (content: Text("not verified")),)
                                    }
                                  ),
                                  labelText: "OTP",labelStyle:
                                  TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          SizedBox(height:size.height*0.005),
                          Container(


                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: passwordController,
                              validator: (String value){
                                if(value.isEmpty){
                                  return "Password can not be empty";
                                }if(value.length<7){
                                  return "Password should be grater than 6 char";
                                }else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration( suffixIcon: IconButton(icon: Icon(
                                  _secureText ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },),
                                  border: const UnderlineInputBorder(),
                                  prefix:Icon(FontAwesomeIcons.key,color: Colors.blue,size:20),
                                  labelText: "Password",labelStyle:
                                  TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),


                              obscureText: _secureText,

                            ),
                          ),

                          SizedBox(height:size.height*0.005),
                          Container(


                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: confirmpasswordController,
                              validator: (String value){
                                if(value.isEmpty||value!=passwordController.text){
                                  return "Password not match";
                                }if(value.length<7){
                                  return "Password should be grater than 6 char";
                                }else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration( suffixIcon: IconButton(icon: Icon(
                                  _secureText ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },),
                                  border: const UnderlineInputBorder(),
                                  prefix:Icon(FontAwesomeIcons.key,color: Colors.blue,size:20),
                                  labelText: 'Confirm password',labelStyle:
                                  TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),


                              obscureText: _secureText,

                            ),
                          ),
                          Container(

                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: addressController,
                              validator: (String value){
                                if(value.isEmpty){
                                  return "Address can not be empty";
                                }if(value.length<7){
                                  return "Enter Correct Address";
                                }else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration( prefix:Icon(FontAwesomeIcons.home,color: Colors.blue,size:20),
                                  border: const UnderlineInputBorder(),
                                  suffixIcon:addressController.text.isEmpty?Container(width: 0,): IconButton(
                                    icon:Icon(Icons.close),
                                    onPressed: ()=>addressController.clear(),
                                  ),
                                  labelText: "Address",labelStyle:
                                  TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),

                            ),
                          ),
                      SizedBox(height:size.height*0.005),
                          Container(

                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              controller: flatnoController,
                              validator: (String value){
                                if(value.isEmpty){
                                  return "Flat No can not be empty";
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration( prefix:Icon(FontAwesomeIcons.home,color: Colors.blue,size:20),
                                  border: const UnderlineInputBorder(),
                                  suffixIcon:flatnoController.text.isEmpty?Container(width: 0,): IconButton(
                                    icon:Icon(Icons.close),
                                    onPressed: ()=>flatnoController.clear(),
                                  ),
                                  labelText: "Flat No",labelStyle:

                                  TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),

                            ),
                          ),
                          //SizedBox(height:size.height*0.005),
                        //  Container(

                       //     child: TextFormField(
                       //       style: TextStyle(color: Colors.black),
                          //    keyboardType: TextInputType.emailAddress,
                         //     controller: pincodeController,
                        // //     validator: (String value){
                       //         if(value.isEmpty){
                       //           return "Pin can not be empty";
                        //        }if(value.isEmpty ||value.length>4 || value.length<4){return "Code should be 4 digits ";}if(value.isEmpty || value!="ABCD"){return "Wrong Code  ";
                             //   }else{
                              //    return null;
                             //   }
                        //      },
                         //     decoration: InputDecoration( prefix:Icon(FontAwesomeIcons.home,color: Colors.blue,size:20),
                        /////          border: const UnderlineInputBorder(),
                        //          suffixIcon:pincodeController.text.isEmpty?Container(width: 0,): IconButton(
                        ///            icon:Icon(Icons.close),
                           //         onPressed: ()=>pincodeController.clear(),
                            //      ),
                         ///         labelText: "Pin Code",labelStyle:

                               //   TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),
//
                        //    ),
                      //    ),

                          SizedBox(height:size.height*0.03),
                          InkWell(
                              child: Container(alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    color: Colors.blue
                                ),
                                child: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                              onTap: (){Register();

                              }
                          ),
                          SizedBox(height:size.height*0.01),
                          Container(alignment: Alignment.centerRight,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already Have an Account?",style: TextStyle(color: Colors.black),),
                                SizedBox(width:5.0),
                                InkWell(
                                    child: Text('Login Here',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>huuilogin()));
                                    }),
                              ],
                            ),
                          ),
                        ]  ),

                  ),

                ),

            ],
          ),
        )
      ] ,)  //;
    //}


    //else{return Icon(Icons.wifi_off,size:30);

    //}
 // }

  //)

    ),);
  }

  void Register()async{
    try{
      if(_formKey.currentState.validate()){
        setState(() {
          isLoading= true;
        });
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text).then((user){
          setState(() {
            isLoading= false;
          });
          Post();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
          Fluttertoast.showToast(
              msg: "SignUp Successfully ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
        });
      }
    }
    on FirebaseAuthException catch(e){
      setState(() {
        isLoading= false;
      });
      print(e.toString());
      Fluttertoast.showToast(
          msg: "Email is Already taken ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

  }

  void realtimedb(){
    setState(() {
      isLoading= true;
    });



  }

  // ignore: non_constant_identifier_names
  void Post() async{
    setState(() {
      isLoading= true;
    });
    // ignore: await_only_futures
    FirebaseAuth firebaseAuth = await FirebaseAuth.instance;
    String uid = firebaseAuth.currentUser.uid.toString();
    UserModels userModels = new UserModels();
    userModels.email = emailController.text;
    userModels.username = usernameController.text;
    userModels.mobile = phoneController.text;
    userModels.address = addressController.text;
    userModels.pin = pincodeController.text;
    userModels.password = passwordController.text;
    userModels.confirmpassword = confirmpasswordController.text;
    userModels.flatno = flatnoController.text;
    userModels.uid = uid;
    DatabaseReference postref = FirebaseDatabase.instance.reference().child('usersdata').child(currentUser());
    postref.push().set({"Name": userModels.username,"Email": userModels.email,"Mobile No":userModels.mobile ,"Address":userModels.address,"flat no":userModels.flatno});

    ref.child("Motor Control").set({"switch" : !value});

    await FirebaseFirestore.instance.collection('Data').doc(uid).set(userModels.toMap()).then((value){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
      Fluttertoast.showToast(
          msg: "SignUp Successfully ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

    });

    setState(() {
      isLoading = false;
    });

  }

}

