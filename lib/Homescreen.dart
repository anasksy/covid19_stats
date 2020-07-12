import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 14.4, top: 14.4),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white54,
                    size: 35.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 259.2, top: 14.4),
                  child: Icon(
                    Icons.search,
                    color: Colors.white54,
                    size: 35.0,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
