import 'main.dart';

class Utils {
  /* print debug message */
  static void printDebug(String message) {
    if (debug_mode) {
      print("DEBUG: " + message);
    }
  }

  /* check if debug is on */
  static bool debug() {
    return debug_mode;
  }
}
