import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homescreen.dart';

/* global variables */
bool debug_mode = true;

void main() {
  runApp(CovidApp());
}

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Colorized StatusBar
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.purple[800],
      ),
    );
    // Return material app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
