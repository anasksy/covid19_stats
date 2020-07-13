import 'package:flutter/material.dart';
import 'utils.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<bool> _selections = List.generate(2, (_) => false);
    List<bool> _selections2 = List.generate(3, (_) => false);
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        children: <Widget>[
          // Added white container with rounded corners
          Container(
            margin: EdgeInsets.only(top: 475),
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
            margin: EdgeInsets.only(top: 510, left: 24),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Added Menu-IconButton at the top left corner
                    Container(
                      margin: EdgeInsets.only(left: 14.4, top: 14.4),
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Utils.printDebug("PRESSED MENU BUTTON");
                        },
                        color: Colors.white,
                        highlightColor: Colors.white70,
                        iconSize: 35.0,
                      ),
                    ),
                    // Added Search-IconButton at the top right corner
                    Container(
                      margin: EdgeInsets.only(right: 14.4, top: 14.4),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Utils.printDebug("PRESSED SEARCH BUTTON");
                        },
                        color: Colors.white,
                        highlightColor: Colors.white70,
                        iconSize: 35.0,
                      ),
                    ),
                  ],
                ),
                // Added "Statistics" Text
                // ==> it's under the Menu-IconButton at the top left corner
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
                  padding: EdgeInsets.only(left: 50, right: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white54,
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: ToggleButtons(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    children: <Widget>[
                      // maybe changing FlatButton to RaisedButton
                      FlatButton(
                        child: Text(
                          "My Country",
                          style: TextStyle(color: Colors.white70),
                        ),
                        onPressed: () {
                          Utils.printDebug("PRESSED MYCOUNTRY BUTTON");
                        },
                      ),
                      FlatButton(
                        child: Text(
                          "Global",
                          style: TextStyle(color: Colors.white70),
                        ),
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
                    },
                    renderBorder: false,
                  ),
                ),
                // Added TOTAL/TODAY/YESTERDAY Buttons
                ToggleButtons(
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        "Total",
                        style: TextStyle(color: Colors.white54),
                      ),
                      onPressed: () {
                        Utils.printDebug("PRESSED TOTAL BUTTON");
                      },
                    ),
                    FlatButton(
                      child: Text(
                        "Today",
                        style: TextStyle(color: Colors.white54),
                      ),
                      onPressed: () {
                        Utils.printDebug("PRESSED TODAY BUTTON");
                      },
                    ),
                    FlatButton(
                      child: Text(
                        "Yesterday",
                        style: TextStyle(color: Colors.white54),
                      ),
                      onPressed: () {
                        Utils.printDebug("PRESSED YESTERDAY BUTTON");
                      },
                    ),
                  ],
                  isSelected: _selections2,
                  renderBorder: false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
