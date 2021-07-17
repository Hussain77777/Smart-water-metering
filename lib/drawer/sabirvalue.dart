import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../linearSales.dart';



class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {

  String uid = FirebaseAuth.instance.currentUser.uid;

  Map<dynamic, dynamic> data;
  List<Map<String, dynamic>> listMap = [];
  var a = 0, b = 0,z=0,y, reslut=0;
  var flowMainline, flowRoom1,flowRoom3,flowRoom2, flowRoom1Result=0,flowRoom3Result=0,flowRoom2Result=0, flowMainlineResult=0;
  LinearSales linearSales;
  List<LinearSales> listLinearSales = [];
  String userName, address, flatno, mobileNumber, email, pin;

  var intValue;
  setIntValues(var value, var name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(name, value);
  }

  var room1Flow,room3Flow,room2Flow, mainlineFlow;
  var room1Water,room2Water,room3Water, mainlineWater, room1WaterReslut=0,room2WaterReslut=0 ,room3WaterReslut=0 ,mainlineWaterReslut=0;

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      room1Flow = prefs.getInt("room1Flow");
      room2Flow = prefs.getInt("room2Flow");
      room3Flow = prefs.getInt("room3Flow");

      mainlineFlow = prefs.getInt("mainlineFlow");
      intValue = prefs.getInt('dailyWaterConsumed');
      room1Water = prefs.getInt("room1Water");
      room3Water = prefs.getInt("room3Water");
      room2Water = prefs.getInt("room2Water");
      mainlineWater = prefs.getInt('mainlineWater');
    });
  }
double s=0;
  var sum=0;
  var monthly = 0;
  void addMonthlyValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Timer(Duration(hours: 24), () {
      if (monthly != null) {
        setState(() {
          monthly = sum;
          print(monthly);
        });
        setIntValues(monthly, "monthly");
        monthly = prefs.getInt("monthly");
      } else {
        setState(() {
          monthly = sum;
        });
      }
    });
  }

  void removeDailyUsage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Timer(Duration(seconds: 10), () {
      prefs.remove('dailyWaterConsumed');
    });
  }

  @override
  //void initState() {
  //  getIntValuesSF();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    addMonthlyValue();
    getIntValuesSF();
    Size size = MediaQuery.of(context).size;
    return Scaffold(appBar: AppBar(title: Text("Current Flow Rate ",textAlign: TextAlign.center,),actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        onPressed: () {
         },
      )
    ],),
      body: StreamBuilder(
        stream: FirebaseDatabase.instance
            .reference()
            .child("usersdata")
            .child(uid)
            .onValue,
        builder: (ctx, snapShot) {
          if (snapShot.hasData) {
            getIntValuesSF();
            data = Map<String, dynamic>.from(snapShot.data.snapshot.value);
            if (data != null) {
              data.forEach((key, value) {
                getIntValuesSF();

                value.forEach((key, d) {
                  if (key == "Name") {
                    userName = d;
                  }
                  if (key == "Email") {
                    email = d;
                  }
                  if (key == "Address") {
                    address = d;
                  }
                  if (key == "Mobile No") {
                    mobileNumber = d;
                  }
                  if (key == "flat no") {
                    flatno = d;
                  }

                  // email = d["Email"];

                  if (key == "Flat Data") {
                    d.forEach((key, c) {
                      getIntValuesSF();


                      if (key == "Flow") {
                   //     b = c["Total Water Consumed"];
                        flowRoom1 = c["Current Flow Rate"];

                        if (room1Flow == null) {
                          setIntValues(flowRoom1, "room1Flow");
                        }
                     ///   if (room1Water == null) {
                      //    setIntValues(b, "room1Water");
                      //  }
                      //  getIntValuesSF();
                      ////  if (room1Water != null) {
                       //   room1WaterReslut = room1Water + b;
                       // }
                      if (room1Flow != null) {
                    flowRoom1Result =// room1Flow +
                        flowRoom1;
                      }
                      }


                    });
                  }
                });
              });
            }
            return ListView(
              children: [
                SizedBox(
                  height: 12.0,
                ),
                // Center(child: Text("User Details")),
                Container(//width: size.width,height: size.height*0.3,
                    child:  ClipRRect(child: Image.asset("assets/images/A.jpg",width: size.width,height:size.height*0.3,fit: BoxFit.fill,)
                  ,),),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    new CircularPercentIndicator(
                      radius: 150.0,
                      lineWidth: 13.0,
                      animation: true,
                      percent: s,
                      center: new Text(
                        "$flowRoom1Result /litre",
                        style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),

                      footer: new Text(
                        "Current Flow rate ",
                        style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                    ),
Container(
  width: size.width*3,
  height: size.height*0.1,
  //  child:Image.asset("assets/images/images (1).png"),
)

                  ],
                ),
                // SizedBox(
                //  height: 36.0,
                // ),
                // DailyGraph(listLinearSales),
                // SizedBox(
                //   height: 12.0,
                // ),

                //   Center(child: Text("Monthly Usage = $monthly")),

                // // Center(child: Text("Current Flow Rate Mainline = $a")),
                //  Center(child: Text("Total Water Consumed Total = $sum")),
                //  Center(
                //     child: Text(
                //        "Total Water Consumed Mainline = $mainlineWaterReslut")),
                //   Center(
                //    child:
                //   Text("Total Water Consumed Room1 = $room1WaterReslut")),
                //Center(
                //child:
                // Text("Total Water Consumed Room2 = $room2WaterReslut")),

                //  MonthlyGraph(reslut),
                // Center(
                //      child: Text("Current Flow Rate Room1 = $flowRoom1Result")),
                //   Center(
                //      child: Text("Current Flow Rate Room2 = $flowRoom2Result")),
                // Center(
                //    child: Text(
                //       "Current Flow Rate Mainline= $flowMainlineResult")),

                // SizedBox(
                //   height: 36.0,
                // ),

                //Row(children: [

                 // Container(

               //     child: CircleAvatar(radius: 70,child:Text("      $flowRoom1Result\n  Current \n Flow rate ",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),) ),
               //   )

             //   ],),

               ]
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
