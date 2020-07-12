import 'main.dart';

class Utils {
  /* print debug message */
  printDebug(String message) {
    if (debug_mode) {
      print("DEBUG: " + message);
    }
  }
}
