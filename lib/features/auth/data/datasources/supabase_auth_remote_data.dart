import 'package:cityu_student_protal/core/enums/department.dart';
import 'package:cityu_student_protal/core/enums/gender.dart';
import 'package:cityu_student_protal/core/enums/shift.dart';
import 'package:cityu_student_protal/core/error/exception.dart';
import 'package:cityu_student_protal/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRemoteData implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  const SupabaseAuthRemoteData({required this.supabaseClient});

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
    required String email,
    required String tempPassword,
  }) async {
    try {
      final res = await supabaseClient.auth.signUp(
        password: tempPassword,
        email: email,
        data: {
          'studentID': studentID,
          'gender': gender,
          'batch': batch,
          'department': department,
          'shift': shift,
        },
      );

      if (res.user == null) {
        throw const ServerException(message: 'User is null');
      }
      return res.user!.id;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
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
