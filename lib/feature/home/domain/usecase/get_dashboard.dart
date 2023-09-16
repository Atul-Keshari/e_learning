import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';

import 'package:e_learning/feature/home/data/models/get_dashboard_res.dart';
import 'package:e_learning/feature/home/domain/repo/get_dashboard_repo.dart';

class GetDashboard implements UseCase<GetDashboardResponse, NoParams> {
  final GetDashboardRepository? getDashboardRepository;

  GetDashboard(this.getDashboardRepository);

  @override
  Future<Either<Failure, GetDashboardResponse>> call(NoParams params) async {
    return await getDashboardRepository!.getDashboard();
  }
}
