import 'package:google_fonts/google_fonts.dart';
import 'utils.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // old code 1 ==> List<bool> _selections = List.generate(2, (_) => false);
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
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
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
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 23.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Added MyCountry/Global SwitchButton
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ToggleSwitch(
                      minWidth: 150.0,
                      cornerRadius: 20,
                      activeBgColor: Colors.white,
                      activeTextColor: Colors.black87,
                      inactiveBgColor: Colors.white54,
                      inactiveTextColor: Colors.white70,
                      labels: ['My Country', 'Global'],
                      onToggle: (index) {
                        print('switched to: $index');
                      }),
                ),
                // Added TOTAL/TODAY/YESTERDAY Buttons
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: ToggleButtons(
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
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
