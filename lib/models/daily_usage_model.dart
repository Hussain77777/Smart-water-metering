import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';


class DailyUsageModel{
  final double usageValue;
  final String hours;
  final double flow;
  final charts.Color color;

  DailyUsageModel({
    @required this.usageValue,
   @ required  this.hours,
    @required  this.flow,
   @ required  this.color
});
}