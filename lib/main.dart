import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'api/api.dart';
import 'homescreen.dart';
import 'utils.dart';

/* global variables */
bool debug_mode = true;

void main() {
  runApp(CovidApp());
  if (API.loadData() == false) {
    // no internet or api couldnt get initialized
    Utils.printDebug("API INIT ERROR");
    // no internet screen
  } else {
    Utils.printDebug("API INIT SUCCESSFUL");
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
