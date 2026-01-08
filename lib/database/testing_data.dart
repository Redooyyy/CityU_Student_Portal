import 'dart:convert';

import 'package:flutter/services.dart';

class TestingData {
  static Future<Map<String, dynamic>> loadRoutine() async {
    final String jString = await rootBundle.loadString(
      "assets/data/dummy.json",
    );
    final routineData = jsonDecode(jString);
    return routineData["class_routine"];
  }
}
