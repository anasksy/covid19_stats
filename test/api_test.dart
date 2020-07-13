import 'package:flutter_test/flutter_test.dart';
import 'package:covid19_mobileapp/api/api.dart';

void main() {
  test('load data (fetch json and convert it to usable data)', () {
    API.loadData();
    expect(API.loadData(), true);
  });
}
