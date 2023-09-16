import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/lecture/data/data_source/get_all_lecture_of_course_remote.dart';
import 'package:e_learning/feature/lecture/data/models/get_all_lecture_of_course_res.dart';
import 'package:e_learning/feature/lecture/domain/repo/get_all_lecture_of_course_repo.dart';

class GetAllLectureRepositoryImpl extends GetAllLectureRepository {
  final NetworkInfo? networkInfo;
  final GetAllLectureRemoteDataSource? getAllLectureRemoteDataSource;

  GetAllLectureRepositoryImpl({
    this.networkInfo,
    this.getAllLectureRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetAllLectureResponse>> getAllLecture(
      String idCourse) {
    return _lectureInCourseContents(
        getAllLectureRemoteDataSource!.getAllLecture(idCourse));
  }

  Future<Either<Failure, GetAllLectureResponse>> _lectureInCourseContents(
      Future<GetAllLectureResponse> getAllLecture) async {
    if (await networkInfo!.isConnected) {
      try {
        final lecture = await getAllLecture;
        return Right(lecture);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
