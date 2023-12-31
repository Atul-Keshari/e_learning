import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/course/data/data_sources/get_member_in_course_remote.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';
import 'package:e_learning/feature/course/domain/repositories/get_member_in_course_repo.dart';

class GetMemberInCourseRepositoryImpl extends GetMemberInCourseRepository {
  final NetworkInfo? networkInfo;
  final GetMemberInCourseRemoteDataSource? getMemberInCourseRemoteDataSource;

  GetMemberInCourseRepositoryImpl({
    this.networkInfo,
    this.getMemberInCourseRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetMemberInCourseResponse>> getMemberInCourse(
      String idCourse, String keySearchName) {
    return _MemberInCourseContents(getMemberInCourseRemoteDataSource!
        .getMemberInCourse(idCourse, keySearchName));
  }

  Future<Either<Failure, GetMemberInCourseResponse>> _MemberInCourseContents(
      Future<GetMemberInCourseResponse> getMemberInCourse) async {
    if (await networkInfo!.isConnected) {
      try {
        final memberInCourse = await getMemberInCourse;
        return Right(memberInCourse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
