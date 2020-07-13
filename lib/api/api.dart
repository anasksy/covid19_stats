import 'parser.dart';
import 'country.dart';
import 'date.dart';

class API {
  /*
   * NOTE: to understand my own code: this is to make this class a singleton and the 
   * _internal (private constructor) is there to not let anyone make a second instance of this class 
   */
  API._internal();
  static final API _instance = API._internal();
  factory API() {
    return _instance;
  }

  /* global variables */
  static var json_string;
  static var countries = new Map<String,
      Country>(); /* <country_name (for example: "Afghanistan"), country object> */

  /* run when the data needs to be loaded / refreshed */
  static bool loadData() {
    json_string = JSONParser().fetchJSON();
    if (json_string == null) {
      /* fetching failed.. */
      return false;
    } else {
      /* fetching worked so return true */
      initCountries(); /* initalize countries map */
      return true;
    }
  }

  /* initalize country map */
  static void initCountries() async {
    String json = await json_string;
    countries = JSONParser.getCountriesfromJSON(json);
  }

  /* returns country object by the country name (for example: "Afghanistan") */
  static Country getCountryByName(String country_name) {
    return countries[country_name];
  }

  /* returns date object by date_count and country */
  static Date getDateByCountry(int date_count, Country country) {
    return country.dates[date_count];
  }

  /* returns date_count by country and date_string(yyyy-mm-dd) */
  static int getDateCountByDateString(String date_string, Country country) {
    for (int i = 0; i < country.dates.length - 1; i++) {
      if (country.dates[i].date_string == date_string) return i;
    }
    return null; /* no date count was found */
  }

  /* returns confirmed cases by date object */
  static int getConfirmedCasesByDate(Date date) {
    return date.confirmed;
  }

  /* returns total deaths by date object */
  static int getDeathsByDate(Date date) {
    return date.deaths;
  }

  /* returns recovered patients by date object */
  static int getRecoveredByDate(Date date) {
    return date.recovered;
  }

  /* convert date-string into date format */
  static DateTime formatDateString(String date_string) {
    /* date_string is in format (yyyy-mm-dd) */
    var formatted = date_string.split("-");
    return new DateTime(int.parse(formatted[0]), int.parse(formatted[1]),
        int.parse(formatted[2]));
  }
}
