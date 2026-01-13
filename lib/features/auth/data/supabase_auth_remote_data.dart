import 'package:cityu_student_protal/core/enums/department.dart';
import 'package:cityu_student_protal/core/enums/gender.dart';
import 'package:cityu_student_protal/core/enums/shift.dart';
import 'package:cityu_student_protal/features/auth/data/auth_remote_data_source.dart';

class SupabaseAuthRemoteData implements AuthRemoteDataSource {
  @override
  Future<String> addAuthority({
    required String name,
    required Gender gender,
    required Department department,
    required String email,
    required String tempPassword,
  }) {
    // TODO: implement addAuthority
    throw UnimplementedError();
  }

  @override
  Future<String> addStudent({
    required String studentID,
    required Gender gender,
    required String batch,
    required Department department,
    required Shift shift,
    required String tempPassword,
  }) {
    // TODO: implement addStudent
    throw UnimplementedError();
  }

  @override
  Future<String> loginViaEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginViaEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<String> loginViaStudentID({
    required String studentID,
    required String batch,
    required Department department,
    required Shift shift,
    required String password,
  }) {
    // TODO: implement loginViaStudentID
    throw UnimplementedError();
  }
}
