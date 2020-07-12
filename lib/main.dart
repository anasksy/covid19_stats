import 'package:flutter/material.dart';
import 'homescreen.dart';

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
