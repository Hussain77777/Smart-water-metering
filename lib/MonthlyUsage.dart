import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Monthlyusage extends StatelessWidget {
  @override
  final String  //Motorstatus,
      D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, D16,
      D17, D18, D19, D20, D21, D22, D23;
      Monthlyusage(
  {Key key,  this.D0, //this.Motorstatus,
  this.D1, this.D2, this.D3, this.D4, this.D5, this.D6, this.D7,
  this.D8, this.D9, this.D10, this.D11, this.D12
  , this.D13, this.D14, this.D15, this.D16, this.D17, this.D18, this.D19,
  this.D20, this.D21, this.D22, this.D23,

  }) : super(key: key);


  @override
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    // print(formattedDate); // 2016-01-25
    return Scaffold(appBar: AppBar(title: (Text("Daily Usage ",textAlign: TextAlign.center,)
    )
    ),
      body: SingleChildScrollView(
        child: DataTable(columns: const <DataColumn>[

          DataColumn(label: Text("Date", style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),)),
          DataColumn(label: Text("Usage", style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),)),
        ],
            rows: <DataRow>[
              DataRow(cells: <DataCell>[

                DataCell(Text('21/6/2021',style: TextStyle(fontSize: 16),),),
                DataCell(Text("$D0 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),

              ]),
              DataRow(cells: <DataCell>[

                DataCell(Text('22/6/2021',style: TextStyle(fontSize: 16),),),
                DataCell(Text("$D1 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),

              ]),
              DataRow(cells: <DataCell>[

                DataCell(Text('23/6/2021',style: TextStyle(fontSize: 16),),),
                DataCell(Text("$D2 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),

              ]),
              DataRow(cells: <DataCell>[

                DataCell(Text('24/6/2021',style: TextStyle(fontSize: 16),),),
                DataCell(Text("$D3 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),

              ]),
              DataRow(cells: <DataCell>[

                DataCell(Text('25/6/2021',style: TextStyle(fontSize: 16),),),
                DataCell(Text("$D4 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('26/6/2021',style: TextStyle(fontSize: 16),),),
                DataCell(Text("$D5 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('27/6/2021',style: TextStyle(fontSize: 16),),),
                DataCell(Text("$D6 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),

              ]),
              DataRow(cells: <DataCell>[

                DataCell(Text('28/6/2021',style: TextStyle(fontSize: 16),),),
                DataCell(Text("$D7 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),

              ]),
              DataRow(cells: <DataCell>[

                DataCell(Text('29/6/2021',style: TextStyle(fontSize: 16),),),
                DataCell(Text("$D8 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 15),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('30/6/2021',style: TextStyle(fontSize: 16),),),
                DataCell(Text("$D9 /Litres", style: TextStyle(color: Colors.black,
                    fontSize:15),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('June Monthly Usage',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                DataCell(Text("$D10 /Litres", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                    fontSize: 15),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('1/7/2021'),),
                DataCell(Text("$D11 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('18/6/2021'),),
                DataCell(Text("$D12 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('19/6/2021'),),
                DataCell(Text("$D13 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('20/6/2021'),),
                DataCell(Text("$D14 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('21/6/2021'),),
                DataCell(Text("$D15 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('22/6/2021'),),
                DataCell(Text("$D16 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('23/6/2021'),),
                DataCell(Text("$D17 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),
              DataRow(cells: <DataCell>[

                DataCell(Text('24/6/2021'),),
                DataCell(Text("$D18 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('25/6/2021'),),
                DataCell(Text("$D19 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('26/6/2021'),),
                DataCell(Text("$D20 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),   DataRow(cells: <DataCell>[

                DataCell(Text('27/6/2021'),),
                DataCell(Text("$D21 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),
              DataRow(cells: <DataCell>[

                DataCell(Text('28/6/2021'),),
                DataCell(Text("$D22 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),
              DataRow(cells: <DataCell>[

                DataCell(Text('29/6/2021'),),
                DataCell(Text("$D23 /Litres", style: TextStyle(color: Colors.black,
                    fontSize: 12),)),

              ]),















            ]
        ),
      ),
    );
  }
}