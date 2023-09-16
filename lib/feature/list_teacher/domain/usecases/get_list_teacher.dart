import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/list_teacher/data/models/list_teacher_response_model.dart';
import 'package:e_learning/feature/list_teacher/domain/repositories/list_teacher_repository.dart';

class GetListTeacher implements UseCase<ListTeacherResponseModel, NoParams> {
  final ListTeacherRepository? listTeacherRepository;

  GetListTeacher(this.listTeacherRepository);

  @override
  Future<Either<Failure, ListTeacherResponseModel>> call(
      NoParams params) async {
    return await listTeacherRepository!.getListTeacher();
  }
}
