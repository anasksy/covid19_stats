import 'date.dart';

class Country {
  final String name;
  final Map<String, Date>
      dates; /* <date string(for example: "2020-1-22"), date object> */

  Country(this.name, this.dates);
}
