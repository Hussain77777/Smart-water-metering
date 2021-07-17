import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:warerusagekash/tankLevel.dart';

import 'auth/huuilogin.dart';
import 'auth/huuisplash.dart';
import 'auth/huuiwelcome.dart';
import 'drawer/huuicontactus.dart';
import 'homescreen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  theme: ThemeData(brightness: Brightness.dark),
      home:splashscreen(),
    );
  }
}

