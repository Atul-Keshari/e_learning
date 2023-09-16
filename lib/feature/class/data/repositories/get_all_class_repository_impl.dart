import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/class/data/data_sources/get_all_class_remote_data_source.dart';
import 'package:e_learning/feature/class/data/models/get_all_class_response_model.dart';
import 'package:e_learning/feature/class/domain/repositories/get_all_class_repository.dart';

class GetAllClassRepositoryImpl extends GetAllClassRepository {
  final NetworkInfo? networkInfo;
  final GetAllClassRemoteDataSource? getAllClassRemoteDataSource;

  GetAllClassRepositoryImpl({
    this.networkInfo,
    this.getAllClassRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetAllClassResponseModel>> getAllClass() {
    return _getAllClass(getAllClassRemoteDataSource!.getAllClass());
  }

  Future<Either<Failure, GetAllClassResponseModel>> _getAllClass(
      Future<GetAllClassResponseModel> getProduct) async {
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
