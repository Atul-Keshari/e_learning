import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/home/data/models/get_dashboard_res.dart';

abstract class GetDashboardRepository {
  Future<Either<Failure, GetDashboardResponse>> getDashboard();
}
