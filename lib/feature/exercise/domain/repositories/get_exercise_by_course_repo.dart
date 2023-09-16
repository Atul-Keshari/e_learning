import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/exercise/data/models/get_exercise_by_course_res.dart';

abstract class GetExerciseByCourseRepository {
  Future<Either<Failure, GetExerciseByCourseResponse>> getExerciseByCourse(
      String idCourse);
}
