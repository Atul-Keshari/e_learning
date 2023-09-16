import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/exercise/data/data_source/get_exercise_by_id_account_remote.dart';
import 'package:e_learning/feature/exercise/data/models/get_exercise_by_id_account_res.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_exercise_by_id_account_repo.dart';

class GetExerciseByIdAccountRepositoryImpl
    extends GetExerciseByIdAccountRepository {
  final NetworkInfo? networkInfo;
  final GetExerciseByIdAccountRemoteDataSource?
      getExerciseByIdAccountRemoteDataSource;

  GetExerciseByIdAccountRepositoryImpl({
    this.networkInfo,
    this.getExerciseByIdAccountRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetExerciseByIdAccountResponse>>
      getExerciseByIdAccount(int idAccount) {
    return _exerciseByIdAccountContents(getExerciseByIdAccountRemoteDataSource!
        .getExerciseByIdAccount(idAccount));
  }

  Future<Either<Failure, GetExerciseByIdAccountResponse>>
      _exerciseByIdAccountContents(
          Future<GetExerciseByIdAccountResponse> getExerciseByIdAccount) async {
    if (await networkInfo!.isConnected) {
      try {
        final exerciseByIdAccount = await getExerciseByIdAccount;
        return Right(exerciseByIdAccount);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
