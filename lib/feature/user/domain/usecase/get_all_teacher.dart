import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/class/data/models/get_all_class_response_model.dart';
import 'package:e_learning/feature/class/domain/repositories/get_all_class_repository.dart';
import 'package:e_learning/feature/user/data/models/get_all_teacher_res.dart';
import 'package:e_learning/feature/user/domain/repo/get_all_teacher_repo.dart';

class GetAllTeacher implements UseCase<GetAllTeacherResponse, NoParams> {
  final GetAllTeacherRepository? getAllTeacherRepository;

  GetAllTeacher(this.getAllTeacherRepository);

  @override
  Future<Either<Failure, GetAllTeacherResponse>> call(NoParams params) async {
    return await getAllTeacherRepository!.getAllTeacher();
  }
}
