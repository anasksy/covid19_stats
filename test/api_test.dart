import 'package:flutter_test/flutter_test.dart';
import 'package:covid19_mobileapp/api/api.dart';

void main() {
  test('load data (fetch json and convert it to usable data)', () async {
    API.loadData();
    expect(await API.loadData(), true);
  });

  test('countries map', () {
    print(API.countries.toString());
  });

  test('get "germany" confirmed today', () {
    DateTime time = DateTime.now().subtract(new Duration(days: 1));
    print(API.getConfirmedCasesByDate("Germany", API.formatDateTime(time)));
  });

  test('get "germany" deaths today', () {
    DateTime time = DateTime.now().subtract(new Duration(days: 1));
    print(API.getDeathsByDate("Germany", API.formatDateTime(time)));
  });

  test('get "germany" recovered today', () {
    DateTime time = DateTime.now().subtract(new Duration(days: 1));
    print(API.getRecoveredByDate("Germany", API.formatDateTime(time)));
  });

  test('get global confirmed total', () {
    print(API.getConfirmedCasesGlobalTotal());
  });

  test('get global deaths total', () {
    print(API.getDeathsGlobalTotal());
  });

  test('get global recovered total', () {
    print(API.getRecoveredGlobalTotal());
  });

  test('get "afghanistan" confirmed total', () {
    print(API.getConfirmedCasesTotal("Afghanistan"));
  });

  test('get "afghanistan" deaths total', () {
    print(API.getDeathsTotal("Afghanistan"));
  });

  test('get "afghanistan" recovered total', () {
    print(API.getRecoveredTotal("Afghanistan"));
  });

  test('get global confirmed today', () {
    DateTime time = DateTime.now().subtract(new Duration(days: 1));
    print(API.getConfirmedCasesGlobalByDate(API.formatDateTime(time)));
  });

  test('get global deaths today', () {
    DateTime time = DateTime.now().subtract(new Duration(days: 1));
    print(API.getDeathsGlobalByDate(API.formatDateTime(time)));
  });

  test('get global recovered today', () {
    DateTime time = DateTime.now().subtract(new Duration(days: 1));
    print(API.getRecoveredGlobalByDate(API.formatDateTime(time)));
  });
}
