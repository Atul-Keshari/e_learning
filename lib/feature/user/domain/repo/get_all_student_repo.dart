import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/user/data/models/get_all_studen_res.dart';

abstract class GetAllStudentRepository {
  Future<Either<Failure, GetAllStudentResponse>> getAllStudent();
}
