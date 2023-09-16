import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';
import 'package:e_learning/feature/course/data/models/get_point_teacher_res.dart';

abstract class GetPointTeacherRepository {
  Future<Either<Failure, GetPointTeacherResponse>> getPointTeacher(
    String idCourse,
  );
}
