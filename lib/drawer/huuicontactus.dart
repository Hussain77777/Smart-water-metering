import 'dart:async';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:connectivity/connectivity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:flutter/material.dart';
import 'package:warerusagekash/auth/backgnd.dart';

import '../homescreen.dart';
import '../launcher.dart';




class huuicontactus  extends StatefulWidget {
  @override
  _huuicontactusState createState() => _huuicontactusState();
}
Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _huuicontactusState extends State<huuicontactus > {
  @override
  StreamSubscription subscription;
  bool isconnected=false;
  TwilioFlutter twilioFlutter;
  @override
  final Connectivity _connectivity = Connectivity();
  String _connectionStatus = 'Unknown';
   StreamSubscription<ConnectivityResult> _connectivitySubscription;
  void initState(){
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    smsController.addListener(onListen);
    super.initState();
    subscription=Connectivity().onConnectivityChanged.listen((result){
      setState(() {
        isconnected=(result!=ConnectivityResult.none);
      });


    });
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC86d1d6074ee566dea92bd7b9f6ba7aaa',
          authToken: '32265bf9ca1fb058aab1f77c1d4f3552',
          twilioNumber: '+16514139542');
  }
  void dispose(){
    subscription.cancel();
    super.dispose();
    smsController.dispose();
    _connectivitySubscription.cancel();
    smsController.removeListener(onListen);
  }
  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '+923212444600', messageBody: smsController.text);
  }
  void sendwh()async{

    twilioFlutter.sendWhatsApp(toNumber : '+923212444600',
        messageBody : smsController.text);
  }


  void onListen()=>setState((){});
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  TextEditingController smsController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title: Text("Contact Us",textAlign: TextAlign.center,),

      actions: [
        IconButton(icon: Icon(Icons.call), onPressed: (){
          Utilslaucher.openPhoneCall(phoneNumber: '+923212444600');
        })
      ],),



    body: backgnd(child:
      Column(mainAxisAlignment:MainAxisAlignment.center,
          children:<Widget> [SingleChildScrollView(child:Form (key: _formKey,
          child: Column(children: [

            Container(alignment: Alignment.topRight,padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
              child:            Text("Send us message and we will get back to you as soon as possible.",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                ),

            SizedBox(height: 105.0),
            TextFormField(
                controller: smsController,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Message can not be empty';
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  border: OutlineInputBorder(),
                  hintText: 'Please Enter Full Name \n & Your issue ',
                  hintStyle: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold) ,
                  labelText: 'Message',
                  labelStyle: TextStyle(color: Colors.blueAccent,fontSize: 21,fontWeight: FontWeight.bold),
                  prefix: Icon(FontAwesomeIcons.solidEnvelope,color: Colors.blueAccent,size:30),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null
            ),
         //   Center(child: Text('Connection Status: $_connectionStatus')),
          ],),


          )

            ,)



          ]


      )

      ,),
      floatingActionButton: FloatingActionButton(
        onPressed:(){  sendSms() ;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar
          (content:Text("SMS Sent Succesfully")),);

        Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Home() ),);
        },


        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }
}