import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/home/data/data_course/get_dashboard_remote.dart';
import 'package:e_learning/feature/home/data/models/get_dashboard_res.dart';
import 'package:e_learning/feature/home/domain/repo/get_dashboard_repo.dart';

class GetDashboardRepositoryImpl extends GetDashboardRepository {
  final NetworkInfo? networkInfo;
  final GetDashboardRemoteDataSource? getDashboardRemoteDataSource;

  GetDashboardRepositoryImpl({
    this.networkInfo,
    this.getDashboardRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetDashboardResponse>> getDashboard() {
    return _getDashboard(getDashboardRemoteDataSource!.getDashboard());
  }

  Future<Either<Failure, GetDashboardResponse>> _getDashboard(
      Future<GetDashboardResponse> getDashboard) async {
    if (await networkInfo!.isConnected) {
      try {
        final result = await getDashboard;
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
