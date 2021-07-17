import 'package:flutter/material.dart';
class PDFTABLE extends StatefulWidget {
  @override
  _PDFTABLEState createState() => _PDFTABLEState();
}

class _PDFTABLEState extends State<PDFTABLE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:(Text("Pdf Table")
    )
    ),
      body: SingleChildScrollView(
        child: DataTable(columns:const <DataColumn>[
          DataColumn(label: Text("Duration",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
          DataColumn(label: Text("Time",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
          DataColumn(label: Text("Usage",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
        ],
rows:const<DataRow>[
  DataRow(cells:<DataCell>[
DataCell(Text("Hussain"),),
    DataCell(Text("123"),),
    DataCell(Text("12"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),
  DataRow(cells:<DataCell>[
    DataCell(Text("Hassan"),),
    DataCell(Text("458"),),
    DataCell(Text("123"),),

  ]),

]
        ),
      ),
    );
  }
}
