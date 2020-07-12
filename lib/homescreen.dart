import 'package:flutter/material.dart';

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
                    print("MENU BUTTON CLICKED");
                  },
                  color: Colors.white54,
                  iconSize: 35.0,
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("SEARCH BUTTON CLICKED");
                  },
                  color: Colors.white54,
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
