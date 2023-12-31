import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/list_teacher/data/data_sources/list_teacher_remote_data_source.dart';
import 'package:e_learning/feature/list_teacher/data/models/list_teacher_response_model.dart';
import 'package:e_learning/feature/list_teacher/domain/repositories/list_teacher_repository.dart';

class ListTeacherRepositoryImpl extends ListTeacherRepository {
  final NetworkInfo? networkInfo;
  final ListTeacherRemoteDataSource? listTeacherRemoteDataSource;

  ListTeacherRepositoryImpl({
    this.networkInfo,
    this.listTeacherRemoteDataSource,
  });

  @override
  Future<Either<Failure, ListTeacherResponseModel>> getListTeacher() {
    return _getListTeacher(listTeacherRemoteDataSource!.getListTeacher());
  }

  Future<Either<Failure, ListTeacherResponseModel>> _getListTeacher(
      Future<ListTeacherResponseModel> getProduct) async {
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
