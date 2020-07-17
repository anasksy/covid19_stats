import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'api/api.dart';
import 'utils.dart';

class noConnection extends StatefulWidget {
  @override
  _noConnectionState createState() => _noConnectionState();
}

class _noConnectionState extends State<noConnection> {
  _refreshAPI() async {
    if (await API.loadData() == false) {
      // no internet or api couldnt get initialized
      Utils.printDebug("API INIT ERROR");
    } else {
      // refresh was successful
      Utils.printDebug("API INIT SUCCESSFUL");
      Navigator.pop(context);
    }
  }

  _refreshAction() {
    setState(() {
      _refreshAPI();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Added Text
            Text("No Connection Found",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(color: Colors.white70),
                )),
            // Added REFRESH-IconButton at the top right corner
            Container(
              margin: EdgeInsets.only(right: 14.4, top: 14.4),
              child: IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  _refreshAction();
                  Utils.printDebug("PRESSED REFRESH BUTTON");
                },
                tooltip: "Press to refresh",
                color: Colors.white,
                highlightColor: Colors.white70,
                iconSize: 35.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
