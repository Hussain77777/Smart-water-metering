import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:warerusagekash/models/daily_usage_model.dart';


class Currentflow extends StatelessWidget {
  @override
  final String C0;
  Currentflow(
      {Key key, this.C0

      }) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: (Text("Flow ",textAlign: TextAlign.center,)
    )
    ),
    body: Column(children: [
      Text(" flow $C0 /litre")
    ],),
    );
  }
}
