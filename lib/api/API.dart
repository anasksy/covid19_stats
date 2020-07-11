import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:io';

Future<bool> api_request() async {
  const path = 'https://pomber.github.io/covid19/timeseries.json';
  try {
    final jsonString = await HttpRequest.getString(path); // a GET request
    api_response_process(jsonString); // process the responce
    return true; // return true because request was a sucess
  } catch (e) {
    // The GET request failed. Handle the error.
    print('Couldn\'t open $path');
    return false; // return false because request failed
  }
}

void api_response_process(String jsonString) {}
