import 'date.dart';

class Country {
  final String name;
  final Map<String, Date>
      dates; /* <date string(format: "yyyy-mm-dd"), date object> */

  Country(this.name, this.dates);
}
