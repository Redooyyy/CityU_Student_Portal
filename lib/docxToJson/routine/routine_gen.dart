import 'dart:convert';

import 'package:flutter/services.dart';

class RoutineGen {
  Future<Map<String, dynamic>> loadRoutine(String filePath) async {
    final data = await rootBundle.loadString(filePath);
    return jsonDecode(data);
  }

  //TODO:Conflict resolve here
}
