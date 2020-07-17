import 'dart:convert';

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
  static Future<bool> loadData() async {
    json_string = JSONParser().fetchJSON();
    String json = await json_string;
    if (json == null) {
      /* fetching failed.. */
      return false;
    } else {
      /* fetching worked so return true */
      if (await initCountries() == false)
        return false; /* initalize countries map */
      return true;
    }
  }

  /* initalize country map */
  static Future<bool> initCountries() async {
    String json = await json_string;
    countries = JSONParser.getCountriesfromJSON(json);
    if (countries != null) return true;
    return false;
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

  /* returns confirmed cases by country_name and date_string */
  static int getConfirmedCasesByDate(String country_name, String date_string) {
    int confirmed = 0;
    countries.forEach((_country_name, country_object) {
      if (_country_name == country_name) {
        Map<int, Date> dates = country_object.dates;
        dates.forEach((date_index, date_object) {
          if (date_object.date_string == date_string) {
            confirmed = date_object.confirmed;
          }
        });
      }
    });
    return confirmed;
  }

  /* returns deaths by country_name and date_string */
  static int getDeathsByDate(String country_name, String date_string) {
    int deaths = 0;
    countries.forEach((_country_name, country_object) {
      if (_country_name == country_name) {
        Map<int, Date> dates = country_object.dates;
        dates.forEach((date_index, date_object) {
          if (date_object.date_string == date_string) {
            deaths = date_object.deaths;
          }
        });
      }
    });
    return deaths;
  }

  /* returns recovered patients by country_name and date_string */
  static int getRecoveredByDate(String country_name, String date_string) {
    int recovered = 0;
    countries.forEach((_country_name, country_object) {
      if (_country_name == country_name) {
        Map<int, Date> dates = country_object.dates;
        dates.forEach((date_index, date_object) {
          if (date_object.date_string == date_string) {
            recovered = date_object.recovered;
          }
        });
      }
    });
    return recovered;
  }

  /* returns total confirmed cases by country name */
  static int getConfirmedCasesTotal(String country_name) {
    int confirmed = 0;
    countries.forEach((_country_name, country_object) {
      if (_country_name == country_name) {
        Map<int, Date> dates = country_object.dates;
        confirmed = confirmed + dates[dates.length - 1].confirmed;
      }
    });
    return confirmed;
  }

  /* returns total deaths by country name */
  static int getDeathsTotal(String country_name) {
    int deaths = 0;
    countries.forEach((_country_name, country_object) {
      if (_country_name == country_name) {
        Map<int, Date> dates = country_object.dates;
        deaths = deaths + dates[dates.length - 1].deaths;
      }
    });
    return deaths;
  }

  /* returns total recovered patients by country name */
  static int getRecoveredTotal(String country_name) {
    int recovered = 0;
    countries.forEach((_country_name, country_object) {
      if (_country_name == country_name) {
        Map<int, Date> dates = country_object.dates;
        recovered = recovered + dates[dates.length - 1].recovered;
      }
    });
    return recovered;
  }

  /* return global confirmed cases by date_string (yyyy-mm-dd) */
  static int getConfirmedCasesGlobalByDate(String date_string) {
    int confirmed = 0;
    countries.forEach((country_name, country_object) {
      Map<int, Date> dates = country_object.dates;
      dates.forEach((date_index, date_object) {
        if (date_object.date_string == date_string) {
          confirmed = confirmed + date_object.confirmed;
        }
      });
    });
    return confirmed;
  }

  /* return global deaths by date_string (yyyy-mm-dd) */
  static int getDeathsGlobalByDate(String date_string) {
    int deaths = 0;
    countries.forEach((country_name, country_object) {
      Map<int, Date> dates = country_object.dates;
      dates.forEach((date_index, date_object) {
        if (date_object.date_string == date_string) {
          deaths = deaths + date_object.deaths;
        }
      });
    });
    return deaths;
  }

  /* return global recovered patients by date_string (yyyy-mm-dd) */
  static int getRecoveredGlobalByDate(String date_string) {
    int recovered = 0;
    countries.forEach((country_name, country_object) {
      Map<int, Date> dates = country_object.dates;
      dates.forEach((date_index, date_object) {
        if (date_object.date_string == date_string) {
          recovered = recovered + date_object.recovered;
        }
      });
    });
    return recovered;
  }

  /* return total global confirmed cases */
  static int getConfirmedCasesGlobalTotal() {
    int confirmed = 0;
    countries.forEach((country_name, country_object) {
      Map<int, Date> dates = country_object.dates;
      confirmed = confirmed + dates[dates.length - 1].confirmed;
    });
    return confirmed;
  }

  /* return total global deaths*/
  static int getDeathsGlobalTotal() {
    int deaths = 0;
    countries.forEach((country_name, country_object) {
      Map<int, Date> dates = country_object.dates;
      deaths = deaths + dates[dates.length - 1].deaths;
    });
    return deaths;
  }

  /* return total global recovered patients) */
  static int getRecoveredGlobalTotal() {
    int recovered = 0;
    countries.forEach((country_name, country_object) {
      Map<int, Date> dates = country_object.dates;
      recovered = recovered + dates[dates.length - 1].recovered;
    });
    return recovered;
  }

  /* convert date-string into date format (yyyy-mm-dd) */
  static DateTime formatDateString(String date_string) {
    /* date_string is in format (yyyy-mm-dd) */
    var formatted = date_string.split("-");
    return new DateTime(int.parse(formatted[0]), int.parse(formatted[1]),
        int.parse(formatted[2]));
  }

  /* convert datetime object to date-string (yyyy-mm-dd) */
  static String formatDateTime(DateTime date) {
    int year = date.year;
    int month = date.month;
    int day = date.month;
    return year.toString() + "-" + month.toString() + "-" + day.toString();
  }
}
