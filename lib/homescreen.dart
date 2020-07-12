import 'package:flutter/material.dart';
import 'utils.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Utils.printDebug("MENU BUTTON CLICKED");
                  },
                  color: Colors.white54,
                  highlightColor: Colors.white70,
                  iconSize: 35.0,
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Utils.printDebug("SEARCH BUTTON CLICKED");
                  },
                  color: Colors.white54,
                  highlightColor: Colors.white70,
                  iconSize: 35.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
