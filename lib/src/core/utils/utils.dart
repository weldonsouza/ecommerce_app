import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

var formatFraction = NumberFormat("#,##0.00", "pt_BR");

class Utils {
  static mediaQuery(BuildContext context, double value, {String direction = 'V'}) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
    if (direction.toUpperCase() == 'H') {
      return size.height * value;
    } else {
      return size.width * value;
    }
  }

  static setIntroduction() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? result;

    bool? counter = sharedPreferences.getBool("viewIntroduction") ?? false;

    if (counter == false) {
      sharedPreferences.setBool("viewIntroduction", true);
      result = false;
    } else {
      result = sharedPreferences.getBool("viewIntroduction");
    }

    return result;
  }
}
