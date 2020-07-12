import 'package:flutter/material.dart';
import 'utils.dart';
import 'homescreen.dart';

/* global variables */
bool debug_mode = true;

void main() => runApp(
      CovidApp(),
    );

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
