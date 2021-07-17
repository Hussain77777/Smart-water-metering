import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:warerusagekash/models/daily_usage_model.dart';


class DailyUsage extends StatelessWidget {
  final List<DailyUsageModel> data;
  final String totalValueConsumed, //Motorstatus,
      H0, H1, H2, H3, H4, H5, H6, H7, H8, H9, H10, H11, H12, H13, H14, H15, H16,
      H17, H18, H19, H20, H21, H22, H23, flowrate;

  DailyUsage(
      {Key key, this.data, this.totalValueConsumed, this.H0, //this.Motorstatus,
        this.H1, this.H2, this.H3, this.H4, this.H5, this.H6, this.H7,
        this.H8, this.H9, this.H10, this.H11, this.H12
        , this.H13, this.H14, this.H15, this.H16, this.H17, this.H18, this.H19,
        this.H20, this.H21, this.H22, this.H23, this.flowrate

      }) : super(key: key);


  String finalDate = '';


  // String formatter = DateFormat('yMd').format(now);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return Scaffold(appBar: AppBar(title: (Text("Hourly Usage ",textAlign: TextAlign.center,)
    )
    ),
      body: SingleChildScrollView(
        child: DataTable(columns: const <DataColumn>[
          DataColumn(label: Text("Duration", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),)),
          DataColumn(label: Text("Date", style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),)),
          DataColumn(label: Text("Usage", style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),)),
        ],
            rows: <DataRow>[
              DataRow(cells: <DataCell>[
                DataCell(Text("12am to 1am", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H0 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("1am to 2am", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H1 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("2am to 3am", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H2 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("3am to 4am", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H3 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("4am to 5am", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H4 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("5am to 6am", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H5 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("6am to 7am", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H6 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("7am to 8am", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H7 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("8am to 9am", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H8 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("9am to 10am", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H9 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("10am to 11am", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H10 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("11am to 12pm", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H11 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("12pm to 1pm", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H12 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("1pm to 2pm", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H13 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("2pm to 3pm", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H14 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("3pm to 4pm ", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H15 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("4pm to 5pm", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H16 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("5pm to 6pm", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H17 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("6pm to 7pm", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H18 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("7pm to 8pm", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H19 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("8pm to 9pm ", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H20 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),   DataRow(cells: <DataCell>[
                DataCell(Text("9pm to 10pm", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H21 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("10pm to 11pm ", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H22 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("11pm to 12am", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),
                DataCell(Text('$formattedDate'),),
                DataCell(Text("$H23; /Litres", style: TextStyle(color: Colors.black,
                    fontSize:  15),)),

              ]),
















            ]
        ),
      ),
    );
  }
}