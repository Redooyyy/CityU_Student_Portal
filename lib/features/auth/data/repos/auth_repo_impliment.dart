import 'package:cityu_student_protal/core/enums/department.dart';
import 'package:cityu_student_protal/core/enums/gender.dart';
import 'package:cityu_student_protal/core/enums/shift.dart';
import 'package:cityu_student_protal/core/error/exception.dart';
import 'package:cityu_student_protal/core/error/failure.dart';
import 'package:cityu_student_protal/features/auth/data/datasources/supabase_auth_remote_data.dart';
import 'package:cityu_student_protal/features/auth/domain/repos/auth_repo_structure.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpliment implements AuthRepoStructure {
  final SupabaseAuthRemoteData supabaseAuthRemoteData;

  const AuthRepoImpliment({required this.supabaseAuthRemoteData});

  @override
  Future<Either<Failure, String>> addAuthority({
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
  Future<Either<Failure, String>> addStudent({
    required String studentID,
    required Gender gender,
    required String batch,
    required Department department,
    required Shift shift,
    required String email,
    required String tempPassword,
  }) async {
    try {
      final userID = await supabaseAuthRemoteData.addStudent(
        studentID: studentID,
        gender: gender,
        batch: batch,
        department: department,
        shift: shift,
        email: email,
        tempPassword: tempPassword,
      );
      return right(userID);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> loginViaEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginViaEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginViaStudentID({
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
