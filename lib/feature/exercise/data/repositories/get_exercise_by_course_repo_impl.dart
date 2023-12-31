import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/exercise/data/data_source/get_exercise_by_course_remote.dart';
import 'package:e_learning/feature/exercise/data/models/get_exercise_by_course_res.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_exercise_by_course_repo.dart';

class GetExerciseByCourseRepositoryImpl extends GetExerciseByCourseRepository {
  final NetworkInfo? networkInfo;
  final GetExerciseByCourseRemoteDataSource?
      getExerciseByCourseRemoteDataSource;

  GetExerciseByCourseRepositoryImpl({
    this.networkInfo,
    this.getExerciseByCourseRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetExerciseByCourseResponse>> getExerciseByCourse(
      String idCourse) {
    return _exerciseByCourseContents(
        getExerciseByCourseRemoteDataSource!.getExerciseByCourse(idCourse));
  }

  Future<Either<Failure, GetExerciseByCourseResponse>>
      _exerciseByCourseContents(
          Future<GetExerciseByCourseResponse> getExerciseByCourse) async {
    if (await networkInfo!.isConnected) {
      try {
        final exerciseByCourse = await getExerciseByCourse;
        return Right(exerciseByCourse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
