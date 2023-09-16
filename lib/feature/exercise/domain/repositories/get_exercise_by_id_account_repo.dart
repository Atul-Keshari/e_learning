import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/exercise/data/models/get_exercise_by_id_account_res.dart';

abstract class GetExerciseByIdAccountRepository {
  Future<Either<Failure, GetExerciseByIdAccountResponse>>
      getExerciseByIdAccount(int idAccount);
}
