import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'api/api.dart';
import 'homescreen.dart';
import 'noconnection.dart';
import 'utils.dart';

/* global variables */
bool debug_mode = true;

void main() {
  runApp(CovidApp());
}

class CovidApp extends StatelessWidget {
  loadAPI(context) async {
    if (await API.loadData() == false) {
      // no internet or api couldnt get initialized
      Utils.printDebug("API INIT ERROR");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => noConnection()),
      );
    } else {
      Utils.printDebug("API INIT SUCCESSFUL");
      // refresh was successful
    }
  }

  @override
  Widget build(BuildContext context) {
    //loadAPI
    loadAPI(context);

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
