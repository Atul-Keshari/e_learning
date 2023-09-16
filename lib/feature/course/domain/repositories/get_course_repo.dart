import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/course/data/models/get_couse_res.dart';

abstract class GetCourseRepository {
  Future<Either<Failure, GetCourseResponse>> getCourse(
      String keySearchNameCourse, String idAccount);
}
