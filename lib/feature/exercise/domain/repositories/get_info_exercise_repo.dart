import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/exercise/data/models/get_info_exercise_res.dart';

abstract class GetInfoExerciseRepository {
  Future<Either<Failure, GetInfoExerciseResponse>> getInfoExercise(
      int idExercise);
}
