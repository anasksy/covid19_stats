import 'date.dart';

class Country {
  final String name;
  final Map<int, Date> dates; /* <date count, date object> */

  Country(this.name, this.dates);
}
