import 'parser.dart';
import 'country.dart';
import 'date.dart';

var json_string;
Map<String, Country>
    countries; // <country_name (for example: "Afghanistan"), country object>

class API {
  // gets run when the data needs to be loaded / refreshed
  static bool loadData() {
    json_string = JSONParser().fetchJSON();
    if (json_string == null) {
      // fetching failed..
      return false;
    } else {
      // fetching worked so return true
      initCountries();
      return true;
    }
  }

  // initalize country map
  static void initCountries() {
    for (int i = 0; i < JSONParser.getCountryIndexLength(json_string); i++) {
      Country _country = JSONParser.getCountryfromJSON(json_string, i);
      countries[_country.name] = _country;
    }
  }

  // returns country object by the country name (for example: "Afghanistan")
  static Country getCountryByName(String country_name) {
    return countries[country_name];
  }

  // returns date object by date string (for example: "2020-1-22") and country
  static Date getDateByCountry(String date_string, Country country) {
    return country.dates[date_string];
  }

  // returns confirmed cases by date object
  static int getConfirmedCasesByDate(Date date) {
    return date.confirmed;
  }

  // returns total deaths by date object
  static int getDeathsByDate(Date date) {
    return date.deaths;
  }

  // returns recovered patients by date object
  static int getRecoveredByDate(Date date) {
    return date.recovered;
  }
}
