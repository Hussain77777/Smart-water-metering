import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:auto_orientation/auto_orientation.dart';

import 'package:flutter/services.dart';
class DailyUsageGraphhour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DailyUsageGraphhourState();
}

class  DailyUsageGraphhourState extends State< DailyUsageGraphhour > {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  var totalWaterConsumed;
  var currentFlowRate;
  String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }
  @override
  void initState() {
    print('clima');
    super.initState();
    try{
      _databaseReference
          .child("usersdata")
          .child("QdivOLGr6NRReJkE2qfrybZnpxP2")
          .child("FlatData").once().then((value){
        setState(() {
          //this.totalWaterConsumed = value.value['Total Water Consumed'].toString();
          //this.currentFlowRate = value.value["Current Flow Rate"];
        });
      });
    }catch(e){
      print("error "+e.toString());
    }
  }

  Future<bool> _willPopCallback() async {
    print('clima 3');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    print('clima 2');
    return true;
  }
  @override
  // Set landscape orientation

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
     DeviceOrientation.landscapeRight,
    ]);
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: SafeArea(child: Scaffold(
          backgroundColor: Colors.blueAccent,
          appBar: AppBar(title: Text("Daily Usage Graph",textAlign: TextAlign.center,),),
          body: SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
SizedBox(height: 70,),
                Container(
                    width: size.width,
                    height: size.height*0.75,
                    child:StreamBuilder(
                      stream: _databaseReference
                          .child("usersdata")
                          .child(uid)
                          .child("Data")
                          .child("forGraph").child("TotalWaterConsumed").onValue,
                      builder: (_,snapshot){
                        if(snapshot.hasData){
                          var ref = snapshot.data.snapshot.value;

                          return Container(
                            height:size.height,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: BarChart(
                                    BarChartData(
                                      alignment: BarChartAlignment.spaceAround,
                                      maxY: 5000,
                                      barTouchData: BarTouchData(
                                        enabled: false,
                                        touchTooltipData: BarTouchTooltipData(
                                          tooltipBgColor: Colors.transparent,
                                          tooltipPadding: const EdgeInsets.all(0),
                                          tooltipMargin: 2,
                                          getTooltipItem: (
                                              BarChartGroupData group,
                                              int groupIndex,
                                              BarChartRodData rod,
                                              int rodIndex,
                                              ) {
                                            return BarTooltipItem(
                                              rod.y.round().toString(),
                                              TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        bottomTitles: SideTitles(
                                          showTitles: true,
                                          getTextStyles: (value) => const TextStyle(
                                              color: Colors.yellowAccent, fontWeight: FontWeight.bold, fontSize: 10),
                                          margin: 5,
                                          getTitles: (double value) {
                                            switch (value.toInt()) {
                                              case 0:
                                                return '1am';
                                              case 1:
                                                return '2am ';
                                              case 2:
                                                return '3am ';
                                              case 3:
                                                return '4am ';
                                              case 4:
                                                return '5am ';
                                              case 5:
                                                return '6am';
                                              case 6:
                                                return '7am ';
                                              case 7:
                                                return '8am ';
                                              case 8:
                                                return '9am ';
                                              case 9:
                                                return '10am';
                                              default:
                                                return '';
                                            }
                                          },
                                        ),
                                        leftTitles: SideTitles(showTitles: false),
                                      ),
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      barGroups: [
                                        BarChartGroupData(
                                          x: 0,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["12am-1am"].toString())  , colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 1,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["1am-2am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 2,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["2am-3am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 3,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["3am-4am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 4,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["4am-5am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 5,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["5am-6am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),

                                        BarChartGroupData(
                                          x: 6,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["6am-7am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 7,
                                          barRods: [
                                            BarChartRodData(y:double.parse(ref["7am-8am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 8,
                                          barRods: [
                                            BarChartRodData(y:double.parse(ref["8am-9am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: BarChart(
                                    BarChartData(
                                      alignment: BarChartAlignment.spaceAround,
                                      maxY:5000,
                                      barTouchData: BarTouchData(
                                        enabled: false,
                                        touchTooltipData: BarTouchTooltipData(
                                          tooltipBgColor: Colors.transparent,
                                          tooltipPadding: const EdgeInsets.all(0),
                                          tooltipMargin: 2,
                                          getTooltipItem: (
                                              BarChartGroupData group,
                                              int groupIndex,
                                              BarChartRodData rod,
                                              int rodIndex,
                                              ) {
                                            return BarTooltipItem(
                                              rod.y.round().toString(),
                                              TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        bottomTitles: SideTitles(
                                          showTitles: true,
                                          getTextStyles: (value) => const TextStyle(
                                              color: Colors.yellowAccent,fontWeight: FontWeight.bold, fontSize: 10),
                                          margin: 5,
                                          getTitles: (double value) {
                                            switch (value.toInt()) {
                                              case 0:
                                                return '10am';
                                              case 1:
                                                return '11am';
                                              case 2:
                                                return '12pm';
                                              case 3:
                                                return '1pm';
                                              case 4:
                                                return '2pm';
                                              case 5:
                                                return '3pm';
                                              case 6:
                                                return '4pm';
                                              case 7:
                                                return '5pm';
                                              default:
                                                return '';
                                            }
                                          },
                                        ),
                                        leftTitles: SideTitles(showTitles: false),
                                      ),
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      barGroups: [
                                        BarChartGroupData(
                                          x: 0,
                                          barRods: [
                                            BarChartRodData(y:double.parse(ref["9am-10am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),

                                        BarChartGroupData(
                                          x: 1,
                                          barRods: [

                                            BarChartRodData(y: double.parse(ref["10am-11am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 2,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["11am-12pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 3,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["12pm-1pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 4,
                                          barRods: [
                                            BarChartRodData(y:double.parse(ref["1pm-2pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 5,
                                          barRods: [
                                            BarChartRodData(y:double.parse(ref["2pm-3pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 6,
                                          barRods: [
                                            BarChartRodData(y:double.parse(ref["3pm-4pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),

                                        BarChartGroupData(
                                          x: 7,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["4pm-5pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: BarChart(
                                    BarChartData(
                                      alignment: BarChartAlignment.spaceAround,
                                      maxY: 5000,
                                      barTouchData: BarTouchData(
                                        enabled: false,
                                        touchTooltipData: BarTouchTooltipData(
                                          tooltipBgColor: Colors.transparent,
                                          tooltipPadding: const EdgeInsets.all(0),
                                          tooltipMargin: 2,
                                          getTooltipItem: (
                                              BarChartGroupData group,
                                              int groupIndex,
                                              BarChartRodData rod,
                                              int rodIndex,
                                              ) {
                                            return BarTooltipItem(
                                              rod.y.round().toString(),
                                              TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        bottomTitles: SideTitles(
                                          showTitles: true,
                                          getTextStyles: (value) => const TextStyle(
                                              color: Colors.yellowAccent, fontWeight: FontWeight.bold, fontSize: 10),
                                          margin: 5,
                                          getTitles: (double value) {
                                            switch (value.toInt()) {
                                              case 0:
                                                return '6pm';
                                              case 1:
                                                return '7pm';
                                              case 2:
                                                return '8pm';
                                              case 3:
                                                return '9pm';
                                              case 4:
                                                return '10pm';
                                              case 5:
                                                return '11pm';
                                              case 6:
                                                return '12am';
                                              default:
                                                return '';
                                            }
                                          },
                                        ),
                                        leftTitles: SideTitles(showTitles: false),
                                      ),
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      barGroups: [
                                        BarChartGroupData(
                                          x: 0,
                                          barRods: [
                                            BarChartRodData(y:double.parse(ref["5pm-6pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 1,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["6pm-7pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 2,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["7pm-8pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 3,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["8pm-9pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 4,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["9pm-10pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 5,
                                          barRods: [
                                            BarChartRodData(y:double.parse(ref["10pm-11pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                        BarChartGroupData(
                                          x: 6,
                                          barRods: [
                                            BarChartRodData(y: double.parse(ref["11pm-12am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                          ],
                                          showingTooltipIndicators: [0],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }else {
                          return CircularProgressIndicator();
                        }
                      },
                    )
                ),
               // Container(
                //  margin: EdgeInsets.only(top: size.height*0.02),
                //  child: Text("Total Water Consumed: $totalWaterConsumed",style: TextStyle(color: Colors.white,
                //      fontWeight: FontWeight.w800,
                 //     fontSize: size.width*0.06),),
              //  ),
               // Container(
                //  margin: EdgeInsets.only(top: size.height*0.01),
                //  child: Text("Current Flow Rate: $currentFlowRate",style: TextStyle(color: Colors.white,
                //      fontWeight: FontWeight.w800,
                //      fontSize: size.width*0.06),),
              //  ),
              ],
            ),
          )
      ),

      ),
    );
  }
}
