// import 'dart:io';
//
// import 'package:cityu_student_protal/docxToJson/routine/docx_read.dart';
// import 'package:cityu_student_protal/docxToJson/structure/course.dart';
// import 'package:cityu_student_protal/docxToJson/structure/my_class.dart';
//
// class SaveAsJson {
//   final DocxRead doc = DocxRead();
//
//   Future<Map<String, dynamic>> fetchRoutine(String filePath) async {
//     final tables = await doc.extractTables(filePath);
//
//     final schedule = doc.extractTable(tables[0]);
//     final course = doc.extractTable(tables[1]);
//     final teacher = doc.extractTable(tables[2]);
//
//     final courseMap = <String, Course>{};
//
//     for (var row in course.skip(1)) {
//       if (row.length >= 3) {
//         courseMap[row[0]] = Course(
//           code: row[0],
//           title: row[1],
//           credit: double.tryParse(row[2]) ?? 0,
//         );
//       }
//     }
//
//     final teacherMap = <String,String>{};
//     for(var row in teacher.skip(1)){
//     if(row.length >=2){
//     teacherMap[row[1]] = row[0];
//     }
//   }
//
//     final routine = <String, List<MyClass>>{};
//
//     for(var row in schedule.skip(1)){
//     if(row.isEmpty) continue;
//     final day = row[0];
//     routine[day];
//
//     final classSlot = [
//       {"start"}
//     ];
//
//   }
//
//
//
//
//
//
//   }
//
//   Future<File> saveRoutineAsJson(String savePath) async {
//     final routine = await fetchRoutine();
//   }
// }
