import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/class/data/models/get_all_class_response_model.dart';

abstract class GetAllClassRepository {
  Future<Either<Failure, GetAllClassResponseModel>> getAllClass();
}
