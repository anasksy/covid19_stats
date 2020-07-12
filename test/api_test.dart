import 'package:flutter_test/flutter_test.dart';
import 'package:covid19_mobileapp/api/api.dart';
import 'package:covid19_mobileapp/utils.dart';

import 'dart:convert';

void main() {
  test('load data (fetch json and convert it to usable data)', () {
    API.loadData();
    expect(API.loadData(), true);
  });

  test('testing json parsing', () async {
    API.loadData();
    var json_string = await API.json_string;
    Map decoded = jsonDecode(json_string);
  });
}
