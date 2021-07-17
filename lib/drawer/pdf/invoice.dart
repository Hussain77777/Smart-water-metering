import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:warerusagekash/drawer/pdf/pdf_prevew_screen.dart';


class Invoice extends StatefulWidget {
  const Invoice({Key key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  String uid = FirebaseAuth.instance.currentUser.uid;

  var v1,
      v2,
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
      v12,
      v13,
      v14,
      v15,
      v16,
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      v23,
      v24;
  var pdf;
  var name, email, phoneNo;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    _firestore.collection("Data").doc(uid).get().then((value) {
      name = value.get("username");
      email = value.get("email");
      phoneNo = value.get("mobile");
    });
    _databaseReference
        .child("usersdata")
        .child(uid)
        .child("F")
        .child("forGraph")
        .child("TotalWaterConsumed")
        .once()
        .then((value) {
      print("${value.value["12am-1am"].toString()}");
      v1 = value.value["12am-1am"].toString();
      v2 = value.value["1am-2am"].toString();
      v3 = value.value["2am-3am"].toString();
      v4 = value.value["3am-4am"].toString();
      v5 = value.value["4am-5am"].toString();
      v6 = value.value["5am-6am"].toString();
      v7 = value.value["6am-7am"].toString();
      v8 = value.value["7am-8am"].toString();
      v9 = value.value["8am-9am"].toString();
      v10 = value.value["9am-10am"].toString();
      v11 = value.value["10am-11am"].toString();
      v12 = value.value["11am-12pm"].toString();
      v13 = value.value["12pm-1pm"].toString();
      v14 = value.value["1pm-2pm"].toString();
      v15 = value.value["2pm-3pm"].toString();
      v16 = value.value["3pm-4pm"].toString();
      v17 = value.value["4pm-5pm"].toString();
      v18 = value.value["5pm-6pm"].toString();
      v19 = value.value["6pm-7pm"].toString();
      v20 = value.value["7pm-8pm"].toString();
      v21 = value.value["8pm-9pm"].toString();
      v22 = value.value["9pm-10pm"].toString();
      v23 = value.value["10pm-11pm"].toString();
      v24 = value.value["11pm-12am"].toString();
    }).catchError((error) {
      print(error);
    });
    pdf = pw.Document();
    super.initState();
  }

  writeOnPdf(Size size) {
    pdf.addPage(
      pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.all(40),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.Column(children: [
                      pw.Text("Daily water usage graph",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.Text("Name:",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.Text("Email:",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.Text("Phone #:",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 10),
                      pw.Text("TIME",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 10),
                      pw.Text("12am-1am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("1am-2am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("2am-3am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("3am-4am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("4am-5am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("5am-6am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("6am-7am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("7am-8am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("8am-9am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("9am-10am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("10am-11am:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("11am-12pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("12pm-1pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("1pm-2pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("2pm-3pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("3pm-4pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("4pm-5pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("5pm-6pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("6pm-7pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("7pm-8pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("8pm-9pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("9pm-10pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("10pm-11pm:", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("11pm-12am:", style: pw.TextStyle(fontSize: 15)),
                    ]),

                    /// =============== usage values ==============
                    pw.Column(children: [
                      pw.Text(
                          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.Text("$name",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.Text("$email",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.Text("$phoneNo",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 10),
                      pw.Text("USAGE",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v1", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v2", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v3", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v4", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v5", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v6", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v7", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v8", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v9", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v10", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v11", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v12", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v13", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v14", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v15", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v16", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v17", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v18", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v19", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v20", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v21", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v22", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text("$v23", style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "$v24",
                        style: pw.TextStyle(fontSize: 15),
                      ),
                    ]),
                  ]),
              pw.Footer(
                margin: pw.EdgeInsets.only(top: 5),
              )
            ];
          }),
    );
  }

  savePdfFile() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file =
    File('$documentPath/dailyUsageGraph${DateTime.now().minute}.pdf');

    file.writeAsBytesSync(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text(
                "PDF",
                style: TextStyle(fontSize: 34),
              ),
              MaterialButton(
                onPressed: () async {
                  writeOnPdf(size);

                  savePdfFile();

                  Directory documentDirectory =
                  await getApplicationDocumentsDirectory();

                  String documentPath = documentDirectory.path;

                  String fullPath =
                      "$documentPath/dailyUsageGraph${DateTime.now().minute}.pdf";

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PdfPreviewScreen(
                          path: fullPath,
                        )),
                  );
                },
                color: Colors.blue,
                child: Text("Save pdf"),
              )
            ],
          ),
        ));
  }
}
