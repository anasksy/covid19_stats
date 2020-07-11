import 'package:flutter/material.dart';
import 'Homescreen.dart';

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
