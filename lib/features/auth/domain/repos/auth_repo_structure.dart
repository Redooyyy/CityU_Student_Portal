import 'package:cityu_student_protal/core/enums/department.dart';
import 'package:cityu_student_protal/core/enums/shift.dart';
import 'package:cityu_student_protal/core/error/failure.dart';
import 'package:cityu_student_protal/core/enums/gender.dart';
import 'package:fpdart/fpdart.dart';

//TODO:Now on success passed a String must pass an object but we'll do it later :)
abstract interface class AuthRepoStructure {
  //login via emailPass
  Future<Either<Failure, String>> loginViaEmailAndPassword({
    required String email,
    required String password,
  });

  //login via studentID-batch-department-shift
  Future<Either<Failure, String>> loginViaStudentID({
    required String studentID,
    required String batch,
    required Department department,
    required Shift shift,
    required String password,
  });

  //add student
  Future<Either<Failure, String>> addStudent({
    required String studentID,
    required Gender gender,
    required String batch,
    required Department department,
    required Shift shift,
    required String tempPassword,
  });

  //add authority(Teacher, Co-Odinators etc)
  Future<Either<Failure, String>> addAuthority({
    required String name,
    required Gender gender,
    required Department department,
    required String email,
    required String tempPassword,
  });
}
