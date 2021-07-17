import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

class IotScreen extends StatefulWidget {
  @override
  _IotScreenState createState() => _IotScreenState();
}

class _IotScreenState extends State<IotScreen>
    with SingleTickerProviderStateMixin {
  @override
  final dbRef = FirebaseDatabase.instance.reference();
  bool value = false;
  Color color = Colors.grey;

  onUpdate() {
    setState(() {
      value = !value;
    });

  }

  static final GlobalKey<ScaffoldState> _scaffoldKey =
  new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: (Text("Manual Motor Control ",textAlign: TextAlign.end,
        )
      )
      ),
        key: _scaffoldKey,

        body: SafeArea(
          child: StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data.snapshot.value != null) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                         //   const Text("      MY ROOM",
                            //    style: TextStyle(
                              /////      color: Colors.white,
                                //    fontSize: 20,
                                //    fontWeight: FontWeight.bold)),


                            // ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
Text(
 "Press this button to turn On or Off",style: TextStyle(color:Colors.black,fontSize: 20 ),

),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: FloatingActionButton.extended(
                          icon: value
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          backgroundColor: value ? Colors.blue : Colors.black,
                          label: value ? Text("ON") : Text("OFF"),
                          elevation: 20.00,
                          onPressed: () {
                            onUpdate();
                            writeData();
                          },
                        ),
                      ),
                    ],
                  );
                } else {}
                return CircularProgressIndicator();
              },
              stream: dbRef.child("Motor Control").onValue),
        ),
      ),
    );
  }

  Future<void> writeData() async {
    dbRef.child("Motor Control").set({"switch": !value});

  }




  Future<void> readData() async {
    dbRef.child("Data").once().then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
  }
}