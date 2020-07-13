import 'dart:collection';

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

  /* returns a countries map object from a json string with the country name */
  static Map<String, Country> getCountriesfromJSON(String json_string) {
    Map<String, Country> countries = new Map<String, Country>();
    Map<String, dynamic> json = jsonDecode(json_string);
    json.forEach((String country_name, dynamic country_values) {
      Map<int, Date> dates = new Map<int, Date>();
      int i = 0;
      country_values.forEach((dynamic value) {
        dates[i] = new Date(value["date"].toString(), value["confirmed"] as int,
            value["deaths"] as int, value["recovered"] as int);
        Country country = new Country(country_name, dates);
        countries[country.name] = country;
        i++;
      });
    });
    return countries;
  }
}
