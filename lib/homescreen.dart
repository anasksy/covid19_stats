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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 14.4, top: 14.4),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Utils.printDebug("MENU BUTTON CLICKED");
                    },
                    color: Colors.white54,
                    highlightColor: Colors.white54,
                    iconSize: 35.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 14.4, top: 14.4),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Utils.printDebug("SEARCH BUTTON CLICKED");
                    },
                    color: Colors.white54,
                    highlightColor: Colors.white54,
                    iconSize: 35.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
