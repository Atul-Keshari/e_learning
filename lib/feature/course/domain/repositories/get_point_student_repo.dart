import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/course/data/models/get_point_student_res.dart';

abstract class GetPointStudentRepository {
  Future<Either<Failure, GetPointStudentResponse>> getPointStudent(
      String idCourse, int idAccount);
}
