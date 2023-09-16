import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/exercise/data/models/get_grade_exercise_res.dart';
import 'package:e_learning/feature/exercise/data/models/get_info_exercise_res.dart';

abstract class GetGradeExerciseRepository {
  Future<Either<Failure, GetGradeExerciseResponse>> getGradeExercise(
      int idExercise, String idCourse);
}
