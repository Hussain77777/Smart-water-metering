import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
class TankLevel extends StatefulWidget {
  @override
  _TankLevelState createState() => _TankLevelState();
}

class _TankLevelState extends State<TankLevel> {
  @override
 double t=50,a=0;
  Widget build(BuildContext context) {
    return Scaffold(appBar: new AppBar(
      title: new Text("Tank Level"),
    ),
    body: Center(child: ListView(
      children: [

        new CircularPercentIndicator(
          radius: 120.0,
          lineWidth: 13.0,
          animation: true,

          percent:qw(),
          center: new Text(
            "50.0%",
            style:
            new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          footer: new Text(
            "Current Tank Level",
            style:
            new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.purple,
        ),

      ],
    ),),
    );
  }
double qw(){
  if(t==10){
   return 0.1;
  }
  if(t==20){
    return 0.2;
  }
  if(t==30){
    return 0.3;
  }
  if(t==40){
    return 0.4;
  }
  if(t==50){
    return 0.5;
  }
  if(t==60){
    return 0.6;
  }
  if(t==70){
    return 0.7;
  }
  if(t==80){
    return 0.8;
  }
  if(t==90){
    return 0.9;
  }
  else{
    return 1;

  }
}
}
