import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/exercise/data/data_source/get_grade_exercise_remote.dart';
import 'package:e_learning/feature/exercise/data/data_source/get_info_exercise_remote.dart';
import 'package:e_learning/feature/exercise/data/models/get_grade_exercise_res.dart';
import 'package:e_learning/feature/exercise/data/models/get_info_exercise_res.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_grade_exercise_repo.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_info_exercise_repo.dart';

class GetGradeExerciseRepositoryImpl extends GetGradeExerciseRepository {
  final NetworkInfo? networkInfo;
  final GetGradeExerciseRemoteDataSource? getGradeExerciseRemoteDataSource;

  GetGradeExerciseRepositoryImpl({
    this.networkInfo,
    this.getGradeExerciseRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetGradeExerciseResponse>> getGradeExercise(
      int idExercise, String idCourse) {
    return _infoExerciseContents(getGradeExerciseRemoteDataSource!
        .getGradeExercise(idExercise, idCourse));
  }

  Future<Either<Failure, GetGradeExerciseResponse>> _infoExerciseContents(
      Future<GetGradeExerciseResponse> getGradeExercise) async {
    if (await networkInfo!.isConnected) {
      try {
        final grade = await getGradeExercise;
        return Right(grade);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
