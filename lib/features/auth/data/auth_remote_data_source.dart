import 'package:cityu_student_protal/core/enums/department.dart';
import 'package:cityu_student_protal/core/enums/gender.dart';
import 'package:cityu_student_protal/core/enums/shift.dart';

abstract interface class AuthRemoteDataSource {
  //login via emailPass
  Future<String> loginViaEmailAndPassword({
    required String email,
    required String password,
  });

  //login via studentID-batch-department-shift
  Future<String> loginViaStudentID({
    required String studentID,
    required String batch,
    required Department department,
    required Shift shift,
    required String password,
  });

  //add student
  Future<String> addStudent({
    required String studentID,
    required Gender gender,
    required String batch,
    required Department department,
    required Shift shift,
    required String tempPassword,
  });

  //add authority(Teacher, Co-Odinators etc)
  Future<String> addAuthority({
    required String name,
    required Gender gender,
    required Department department,
    required String email,
    required String tempPassword,
  });
}
