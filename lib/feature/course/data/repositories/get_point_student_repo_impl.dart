import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/course/data/data_sources/get_point_student_remote.dart';
import 'package:e_learning/feature/course/data/models/get_point_student_res.dart';
import 'package:e_learning/feature/course/domain/repositories/get_point_student_repo.dart';

class GetPointStudentRepositoryImpl extends GetPointStudentRepository {
  final NetworkInfo? networkInfo;
  final GetPointStudentRemoteDataSource? getPointStudentRemoteDataSource;

  GetPointStudentRepositoryImpl({
    this.networkInfo,
    this.getPointStudentRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetPointStudentResponse>> getPointStudent(
      String idCourse, int idAccount) {
    return _getPointStudent(
        getPointStudentRemoteDataSource!.getPointStudent(idCourse, idAccount));
  }

  Future<Either<Failure, GetPointStudentResponse>> _getPointStudent(
      Future<GetPointStudentResponse> getPointStudent) async {
    if (await networkInfo!.isConnected) {
      try {
        final result = await getPointStudent;
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
