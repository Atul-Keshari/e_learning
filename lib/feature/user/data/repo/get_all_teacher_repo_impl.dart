import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/class/data/data_sources/get_all_class_remote_data_source.dart';
import 'package:e_learning/feature/class/data/models/get_all_class_response_model.dart';
import 'package:e_learning/feature/class/domain/repositories/get_all_class_repository.dart';
import 'package:e_learning/feature/user/data/data_source/get_all_teacher_remote.dart';
import 'package:e_learning/feature/user/data/models/get_all_teacher_res.dart';
import 'package:e_learning/feature/user/domain/repo/get_all_teacher_repo.dart';

class GetAllTeacherRepositoryImpl extends GetAllTeacherRepository {
  final NetworkInfo? networkInfo;
  final GetAllTeacherRemoteDataSource? getAllTeacherRemoteDataSource;

  GetAllTeacherRepositoryImpl({
    this.networkInfo,
    this.getAllTeacherRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetAllTeacherResponse>> getAllTeacher() {
    return _getAllTeacher(getAllTeacherRemoteDataSource!.getAllTeacher());
  }

  Future<Either<Failure, GetAllTeacherResponse>> _getAllTeacher(
      Future<GetAllTeacherResponse> getProduct) async {
    if (await networkInfo!.isConnected) {
      try {
        final product = await getProduct;
        return Right(product);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
