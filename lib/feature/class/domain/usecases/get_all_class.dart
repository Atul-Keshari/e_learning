import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/class/data/models/get_all_class_response_model.dart';
import 'package:e_learning/feature/class/domain/repositories/get_all_class_repository.dart';

class GetAllClass implements UseCase<GetAllClassResponseModel, NoParams> {
  final GetAllClassRepository? getAllClassRepository;

  GetAllClass(this.getAllClassRepository);

  @override
  Future<Either<Failure, GetAllClassResponseModel>> call(
      NoParams params) async {
    return await getAllClassRepository!.getAllClass();
  }
}
