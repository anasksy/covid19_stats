import 'package:flutter/material.dart';
import 'utils.dart';
import 'package:flutter/services.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<bool> _selections = List.generate(2, (_) => false);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        children: <Widget>[
          // Added white container with border curve at the bottom
          Container(
            margin: EdgeInsets.only(top: 450),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
          ),

          // Added "Daily New Cases" Text
          // ==> it's in the white container at the bottom
          Container(
            child: Text(
              "Daily New Cases",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.only(top: 480, left: 24),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Added Menu-IconButton at the top left
                    Container(
                      margin: EdgeInsets.only(left: 14.4, top: 14.4),
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Utils.printDebug("MENU BUTTON CLICKED");
                        },
                        color: Colors.white,
                        highlightColor: Colors.white70,
                        iconSize: 35.0,
                      ),
                    ),
                    // Added Search-IconButton at the top right
                    Container(
                      margin: EdgeInsets.only(right: 14.4, top: 14.4),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Utils.printDebug("SEARCH BUTTON CLICKED");
                        },
                        color: Colors.white,
                        highlightColor: Colors.white70,
                        iconSize: 35.0,
                      ),
                    ),
                  ],
                ),
                // Added "Statistics" Text
                // ==> it's under the Menu-IconButton at the top left
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 24, top: 33),
                  child: Text(
                    "Statistics",
                    style: TextStyle(
                      fontSize: 23.0,
                      letterSpacing: 0.15,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Added ToggleButtons
                // ==> My Country/Global
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white54,
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: ToggleButtons(
                      children: <Widget>[
                        // maybe changing FlatButton to RaisedButton
                        FlatButton(
                          child: Text("My Country"),
                          onPressed: () {
                            Utils.printDebug("PRESSED MYCOUNTRY BUTTON");
                          },
                        ),
                        FlatButton(
                          child: Text("Global"),
                          onPressed: () {
                            Utils.printDebug("PRESSED GLOBAL BUTTON");
                          },
                        ),
                      ],
                      isSelected: _selections,
                      onPressed: (int index) {
                        setState(() {
                          _selections[index] = !_selections[index];
                        });
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
