import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ProcessStatus {
  loading,
  completed,
  error,
}

GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class Utils {
  static String convertDateTime(String date) {
    var dateTime = DateFormat("yyyy-MM-dd").parse(date);
    return "${DateFormat("MMM dd").format(dateTime)}${dateSuffix(dateTime.day)}";
  }

  static String dateSuffix(int date) {
    var j = date % 10, k = date % 100;
    if (j == 1 && k != 11) {
      return "st";
    }
    if (j == 2 && k != 12) {
      return "nd";
    }
    if (j == 3 && k != 13) {
      return "rd";
    }
    return "th";
  }
}
