import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';

abstract class GetMemberInCourseRepository {
  Future<Either<Failure, GetMemberInCourseResponse>> getMemberInCourse(
      String idCourse, String keySearchName);
}
