// OLD CODE 1
// Added ToggleButtons
// ==> My Country/Global
/* Container(
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

               */
