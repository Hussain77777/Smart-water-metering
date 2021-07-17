import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warerusagekash/auth/huuilogin.dart';

import 'package:warerusagekash/drawer/profilescreen.dart';

import 'package:warerusagekash/models/daily_usage_model.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:warerusagekash/models/db.dart';
import 'package:warerusagekash/tankLevel.dart';

import 'MonthlyUsage.dart';
import 'drawer/Motorcontrol.dart';
import 'drawer/cuntflow.dart';
import 'drawer/daily_usage_graph1.dart';

import 'drawer/hourlyvalue.dart';
import 'drawer/huuicontactus.dart';
import 'drawer/pdf/invoice.dart';
import 'drawer/sabirvalue.dart';
class Ort extends StatefulWidget {
  @override
  _OrtState createState() => _OrtState();
}

class _OrtState extends State<Ort> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  final ref=FirebaseDatabase.instance.reference();
  List<DailyUsageModel> _data;

  String uid = FirebaseAuth.instance.currentUser.uid;


  String named,userName, address, flatno, mobileNumber, email, emaild, pin;
  // ignore: unused_field
  final _auth = FirebaseAuth.instance;
  // ignore: non_constant_identifier_names
  String UserId = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<Posts> postList = [];

  String flatnoflowRate, totalLitres;
  List<DataSnapshot> result;
  currentUser() {
    final User user = FirebaseAuth.instance.currentUser;
    final uid = user.uid.toString();
    return uid;
  }

  void getUserData() async {

    await FirebaseFirestore.instance
        .collection('Data') // suppose you have a collection named "Users"
        .doc( currentUser())
        .get()
        .then((value) {
      setState(() {
        named = value["username"];

        emaild = value["email"];


      });
    });
  }


  void initState() {
    super.initState();
    getUserData();
  }




Widget potrat(){
  Size size = MediaQuery.of(context).size;
    return   SafeArea(

      child: Scaffold(
        appBar: AppBar(title: Text("Dashboard"),),
        drawer: new Drawer(
          child: ListView(

            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName:Text('$named') ,
                accountEmail:Text('$emaild'),

                currentAccountPicture: CircleAvatar( radius: 30, child: ClipOval(child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,

                ),),),
              ),

              ListTile(
                title: Text('Profile'),
                leading: Icon(Icons.account_circle),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>ProfileUi()));
                },
              ),

              ListTile(
                title: Text('flow'),
                leading: Icon(Icons.support),
                onTap: () {
                  CU();
                },
              ),

              ListTile(
                title: Text('Contact Us'),
                leading: Icon(Icons.support),
                onTap: () {
                  Navigator.of(context).pop();  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => huuicontactus()));
                },
              ),
              ListTile(
                title: Text('Logout From this Device'),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => huuilogin()));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [SizedBox(height: 0,),
            Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xffffffff),
                        Color(0xffd1d1de)
                      ]
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                    ),
                    ClipPath(
                        clipper: WaveClipperTwo(),
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection("Data").doc(FirebaseAuth.instance.currentUser.uid).snapshots(),
                          builder: (_,snapshot){
                            if(snapshot.hasData){
                              return  Container(
                                padding: EdgeInsets.only(top: size.height*0.02,left: size.width*0.03,
                                    right: size.width*0.03),
                                alignment: Alignment.centerLeft,
                                width: size.width,
                                height: size.height*0.25,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xff7c59f1),
                                          Color(0xff877de9)
                                        ]
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("${snapshot.data["username"]}",
                                              style: GoogleFonts.cabin(
                                                  color:Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: size.width*0.07
                                              ),),
                                            Text("${snapshot.data["email"]}",
                                              style: GoogleFonts.cabin(
                                                  color:Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: size.width*0.05
                                              ),),
                                          ],),
                                        Text("Flat No:\n ${snapshot.data["flatno"]}",
                                          style: GoogleFonts.cabin(
                                              color:Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: size.width*0.05
                                          ),
                                          textAlign: TextAlign.end,),

                                      ],
                                    )
                                  ],
                                ),
                              );
                            }else{
                              return Container(
                                width: size.width,
                                height: size.height*0.25,
                                child: Column(
                                  children: [
                                    Text(""),
                                  ],
                                ),
                              );
                            }
                          },
                        )
                    ),

                    Positioned(
                      top: size.height*0.15,
                      left: size.width*0.08,
                      right:  size.width*0.08,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>Graph()));
                                },
                                child: Container(
                                  width: size.width*0.31,
                                  height: size.height*0.17,
                                  padding: EdgeInsets.only(bottom: size.height*0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),

                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: size.height*0.02),
                                        width: size.width*0.16,
                                        height: size.width*0.16,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(70)
                                        ),
                                        child: Image.asset("assets/images/flow.png"),
                                      ),
                                      Text("Current Flow",
                                        style: GoogleFonts.cabin(
                                          color: Colors.black,
                                          fontSize: size.width*0.04,

                                        ),)
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>DailyUsageGraphhour()));
                                },
                                child: Container(
                                  width: size.width*0.31,
                                  height: size.height*0.17,
                                  padding: EdgeInsets.only(bottom: size.height*0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),

                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: size.height*0.02),
                                        width: size.width*0.16,
                                        height: size.width*0.16,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(70)
                                        ),
                                        child: Image.asset("assets/images/graph.png"),
                                      ),
                                      Text("Daily Graph",
                                        style: GoogleFonts.cabin(
                                          color: Colors.black,
                                          fontSize: size.width*0.04,

                                        ),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height*0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>TankLevel()));
                                  //  updateChatValues();
                                },
                                child: Container(
                                  width: size.width*0.31,
                                  height: size.height*0.17,
                                  padding: EdgeInsets.only(bottom: size.height*0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),

                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: size.height*0.02),
                                        width: size.width*0.16,
                                        height: size.width*0.16,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(70)
                                        ),
                                        child: Image.asset("assets/images/tank_lvel.png"),
                                      ),
                                      Text("Tank Level",
                                        style: GoogleFonts.cabin(
                                          color: Colors.black,
                                          fontSize: size.width*0.04,

                                        ),)
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>IotScreen()));
                                },
                                child: Container(
                                  width: size.width*0.31,
                                  height: size.height*0.17,
                                  padding: EdgeInsets.only(bottom: size.height*0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),

                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: size.height*0.02),
                                        width: size.width*0.16,
                                        height: size.width*0.16,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(70)
                                        ),
                                        child: Image.asset("assets/images/motor.png"),
                                      ),
                                      Text("Motor Control",
                                        style: GoogleFonts.cabin(
                                          color: Colors.black,
                                          fontSize: size.width*0.04,

                                        ),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height*0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  updateChatValues()   ;                        },
                                child: Container(
                                  width: size.width*0.31,
                                  height: size.height*0.17,
                                  padding: EdgeInsets.only(bottom: size.height*0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),

                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: size.height*0.02),
                                        width: size.width*0.16,
                                        height: size.width*0.16,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(70)
                                        ),
                                        child: Image.asset("assets/images/save.png"),
                                      ),
                                      Text("Hourly Usage",
                                        style: GoogleFonts.cabin(
                                          color: Colors.black,
                                          fontSize: size.width*0.04,

                                        ),)
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  updateMonthly();
                                },
                                child: Container(
                                  width: size.width*0.31,
                                  height: size.height*0.17,
                                  padding: EdgeInsets.only(bottom: size.height*0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),

                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: size.height*0.02),
                                        width: size.width*0.2,
                                        height: size.width*0.2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(70)
                                        ),
                                        child: Image.asset("assets/images/images.png"),
                                      ),
                                      Text("Monthly  Usage",
                                        style: GoogleFonts.cabin(
                                          color: Colors.black,
                                          fontSize: size.width*0.04,

                                        ),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
          ] ),
        ),

      ),
    );
}

Widget Land(){
    return Container(
      child: Text("landscape"),
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: OrientationBuilder(
        builder: (context , orientation){
if (orientation==Orientation.portrait){
return potrat();
} else{
  return Land();

}
        },
      ),
    );
  }
  double totalWaterConsumed=0,C=10  , h0=0,h1=0,h2=0,h3=0,h4=0,h5=0,h6=0,h7=0,h8=0,h9=0,

      h10=0,h11=0,h12=0,h13=0,h14=0,h15=0,h16=0,h17=0,h18=0,h19=0,h20=0,h21=0,h22=0,h23=0;
  double  d0=0,d1=0,d2=0,d3=0,d4=0,d5=0,d6=0,d7=0,d8=0,d9=0,d10=0,d11=0,d12=0,d13=0,d14=0,d15=0,d16=0,d17=0,d18,d19,d20,d21,d22,d23;
  // ignore: non_constant_identifier_names
  void CU(){
    _databaseReference
        .child("usersdata")
        .child(uid)
        .child("Flat Data")
        .child("R1").
    once().then((value) {
      C=value.value["Current Flow Rate"];
    })
        .whenComplete((){

      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => Currentflow( C0:C.toString(),
          )));
    });
  }
  void updateMonthly(){
    _databaseReference
        .child("usersdata")
        .child(uid)
        .child("F")
        .
    once().then((value) {
      d0 = value.value["6-6-21"];
      d1 = value.value["7-6-21"];
      d2 = value.value["8-6-21"];
      d3 = value.value["9-6-21"];
      d4 = value.value["10-6-21"];
      d5 = value.value["11-6-21"];
      d6 = value.value["12-6-21"];
      d7 = value.value["13-6-21"];
      d8 = value.value["14-6-21"];
      d9 = value.value["15-6-21"];
      d10 = value.value["16-6-21"];
      d11 = value.value["17-6-21"];
      d12 = value.value["18-6-21"];
      d13 = value.value["19-6-21"];
      d14 = value.value["20-6-21"];
      d15= value.value["21-6-21"];
      d16= value.value["22-6-21"];
      d17= value.value["23-6-21"];
      d18= value.value["24-6-21"];
      d19 = value.value["25-6-21"];
      d20= value.value["26-6-21"];
      d21= value.value["27-6-21"];
      d22 = value.value["28-6-21"];
      d23= value.value["29-6-21"];

    })
        .whenComplete((){

      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>Monthlyusage(
            D0:d0.toString(),
            D1:d1.toString(),
            D2:d2.toString(),
            D3:d3.toString(),
            D4:d4.toString(),
            D5:d5.toString(),
            D6:d6.toString(),
            D7:d7.toString(),
            D8:d8.toString(),

            D9:h9.toString(),
            D10:d10.toString(),
            D11:d11.toString(),
            D12:d12.toString(),
            D13:d13.toString(),
            D14:d14.toString(),
            D15:d15.toString(),
            D16:d16.toString(),
            D17:d17.toString(),
            D18:d18.toString(),
            D19:d19.toString(),
            D20:d20.toString(),
            D21:d21.toString(),
            D22:d22.toString(),
            D23:d23.toString(),
          )));
    });
  }


  void updateChatValues() {
    _databaseReference
        .child("usersdata")
        .child(uid)
        .child("F")
        .child("forGraph").
    child("TotalWaterConsumed").
    once().then((value){
      h0 = value.value["12am-1am"];
      h1 = value.value["1am-2am"];
      h2 = value.value["2am-3am"];
      h3 = value.value["3am-4am"];
      h4 = value.value["4am-5am"];
      h5 = value.value["5am-6am"];
      h6 = value.value["6am-7am"];
      h7 = value.value["7am-8am"];
      h8 = value.value["8am-9am"];
      h9 = value.value["9am-10am"];
      h10 = value.value["10am-11am"];
      h11 = value.value["11am-12pm"];
      h12 = value.value["12pm-1pm"];
      h13 = value.value["1pm-2pm"];
      h14= value.value["2pm-3pm"];
      h15= value.value["3pm-4pm"];
      h16= value.value["4pm-5pm"];
      h17= value.value["5pm-6pm"];
      h18= value.value["6pm-7pm"];
      h19 = value.value["7pm-8pm"];
      h20= value.value["8pm-9pm"];
      h21= value.value["9pm-10pm"];
      h22 = value.value["10pm-11pm"];
      h23= value.value["11pm-12am"];














    })
        .whenComplete((){

      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>DailyUsage(
            totalValueConsumed: totalWaterConsumed.toString(),
            H0:h0.toString(),
            H1:h1.toString(),
            H2:h2.toString(),
            H3:h3.toString(),
            H4:h4.toString(),
            H5:h5.toString(),
            H6:h6.toString(),
            H7:h7.toString(),
            H8:h8.toString(),
            H9:h9.toString(),
            H10:h10.toString(),
            H11:h11.toString(),
            H12:h12.toString(),
            H13:h13.toString(),
            H14:h14.toString(),
            H15:h15.toString(),
            H16:h16.toString(),
            H17:h17.toString(),
            H18:h18.toString(),
            H19:h19.toString(),
            H20:h20.toString(),
            H21:h21.toString(),
            H22:h22.toString(),
            H23:h23.toString(),
//flowrate:currentflow.toString(),









          )));
    });
  }
}



