class Date {
  final String date_string;
  final int confirmed;
  final int deaths;
  final int recovered;

  Date({this.date_string, this.confirmed, this.deaths, this.recovered});

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      date_string: json['date'] as String,
      confirmed: json['confirmed'] as int,
      deaths: json['deaths'] as int,
      recovered: json['recovered'] as int,
    );
  }
}
