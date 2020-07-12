import 'package:http/http.dart' as http;
import 'dart:convert';
import 'country.dart';

class JSONParser {
  // fetch the json from the web
  Future<String> fetchJSON() async {
    const url = '';
    var response =
        await http.get("https://pomber.github.io/covid19/timeseries.json");
    if (response.statusCode == 200) {
      // fetching was a success so return the JSON as a string
      return response.body.toString();
    } else {
      // fetching failed => return null
      return null;
    }
  }

  // returns a country object from a json string with the country name
  static Country getCountryfromJSON(String json_string, int index) {
    Map<String, dynamic> json = jsonDecode(json_string);
    // TO:DO parse json,, set country object (including every date object)
  }

  // returns the length of all countries in the json
  static int getCountryIndexLength(String json_string) {
    // TO:DO get length of all countries from json (starting at 0)
  }
}
