import 'package:cityu_student_protal/core/enums/department.dart';
import 'package:cityu_student_protal/core/enums/gender.dart';
import 'package:cityu_student_protal/core/enums/shift.dart';
import 'package:cityu_student_protal/core/error/failure.dart';
import 'package:cityu_student_protal/core/usecase/usecase.dart';
import 'package:cityu_student_protal/features/auth/domain/repos/auth_repo_structure.dart';
import 'package:fpdart/fpdart.dart';

class NewStudentAdd implements UseCase<String, StudentAddParameter> {
  final AuthRepoStructure authRepoStructure;

  const NewStudentAdd({required this.authRepoStructure});

  @override
  Future<Either<Failure, String>> call(StudentAddParameter params) async {
    return await authRepoStructure.addStudent(
      studentID: params.studentID,
      gender: params.gender,
      batch: params.batch,
      department: params.department,
      shift: params.shift,
      email: params.email,
      tempPassword: params.tempPassword,
    );
  }
}

//signup parameters
class StudentAddParameter {
  final String studentID;
  final Gender gender;
  final String batch;
  final Department department;
  final Shift shift;
  final String email;
  final String tempPassword;

  StudentAddParameter({
    required this.studentID,
    required this.gender,
    required this.batch,
    required this.department,
    required this.shift,
    required this.email,
    required this.tempPassword,
  });
}
