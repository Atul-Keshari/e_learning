import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/course/data/data_sources/get_course_remote.dart';
import 'package:e_learning/feature/course/data/models/get_couse_res.dart';
import 'package:e_learning/feature/course/domain/repositories/get_course_repo.dart';

class GetCourseRepositoryImpl extends GetCourseRepository {
  final NetworkInfo? networkInfo;
  final GetCourseRemoteDataSource? getCourseRemoteDataSource;

  GetCourseRepositoryImpl({
    this.networkInfo,
    this.getCourseRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetCourseResponse>> getCourse(
      String keySearchNameCourse, String idAccount) {
    return _courseContents(
        getCourseRemoteDataSource!.getCourse(keySearchNameCourse, idAccount));
  }

  Future<Either<Failure, GetCourseResponse>> _courseContents(
      Future<GetCourseResponse> getCourse) async {
    if (await networkInfo!.isConnected) {
      try {
        final course = await getCourse;
        return Right(course);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
