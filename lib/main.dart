import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'api/api.dart';
import 'homescreen.dart';

/* global variables */
bool debug_mode = true;

void main() {
  runApp(CovidApp());
  if(API.loadData() == false){
    // no internet or api couldnt get initialized
  }
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
