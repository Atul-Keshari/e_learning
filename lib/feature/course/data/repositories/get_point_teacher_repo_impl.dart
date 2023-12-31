import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/course/data/data_sources/get_member_in_course_remote.dart';
import 'package:e_learning/feature/course/data/data_sources/get_point_teacher_remote.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';
import 'package:e_learning/feature/course/data/models/get_point_teacher_res.dart';
import 'package:e_learning/feature/course/domain/repositories/get_member_in_course_repo.dart';
import 'package:e_learning/feature/course/domain/repositories/get_point_teacher_repo.dart';

class GetPointTeacherRepositoryImpl extends GetPointTeacherRepository {
  final NetworkInfo? networkInfo;
  final GetPointTeacherRemoteDataSource? getPointTeacherRemoteDataSource;

  GetPointTeacherRepositoryImpl({
    this.networkInfo,
    this.getPointTeacherRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetPointTeacherResponse>> getPointTeacher(
    String idCourse,
  ) {
    return _getPointTeacher(getPointTeacherRemoteDataSource!.getPointTeacher(
      idCourse,
    ));
  }

  Future<Either<Failure, GetPointTeacherResponse>> _getPointTeacher(
      Future<GetPointTeacherResponse> getPointTeacher) async {
    if (await networkInfo!.isConnected) {
      try {
        final result = await getPointTeacher;
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
