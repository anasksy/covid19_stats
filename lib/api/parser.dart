import 'package:http/http.dart' as http;
import 'dart:convert';
import 'country.dart';
import 'date.dart';

class JSONParser {
  /* fetch the json from the web */
  Future<String> fetchJSON() async {
    const url = '';
    var response =
        await http.get("https://pomber.github.io/covid19/timeseries.json");
    if (response.statusCode == 200) {
      /* fetching was a success so return the JSON as a string */
      return response.body.toString();
    } else {
      /* fetching failed => return null */
      return null;
    }
  }

  /* returns a country object from a json string with the country name */
  static Country getCountryfromJSON(String json_string, int index) {
    Map<String, dynamic> json = jsonDecode(json_string);
    /* TO:DO: parse json,, set country object (including every date object) */
    int i = 0;
    json.forEach((String country_name, dynamic country_values) {
      i++;
      if (i == index) {
        Map<int, dynamic> datesjson = json[i];
        Map<int, Date> dates;
        for (int j = 0; j < datesjson.length - 1; j++) {
          dates[j] = Date.fromJson(datesjson[j]);
        }
        Country searched = new Country(country_name, dates);
        return searched; /* success */
      }
    });
    return null; /* failed */
  }

  /* returns the length of all countries in the json */
  static int getCountryIndexLength(String json_string) {
    Map<String, dynamic> json = jsonDecode(json_string);
    return json.length;
  }
}
