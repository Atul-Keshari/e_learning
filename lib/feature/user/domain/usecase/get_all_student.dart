import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/class/data/models/get_all_class_response_model.dart';
import 'package:e_learning/feature/class/domain/repositories/get_all_class_repository.dart';
import 'package:e_learning/feature/user/data/models/get_all_studen_res.dart';
import 'package:e_learning/feature/user/domain/repo/get_all_student_repo.dart';

class GetAllStudent implements UseCase<GetAllStudentResponse, NoParams> {
  final GetAllStudentRepository? getAllStudentRepository;

  GetAllStudent(this.getAllStudentRepository);

  @override
  Future<Either<Failure, GetAllStudentResponse>> call(NoParams params) async {
    return await getAllStudentRepository!.getAllStudent();
  }
}
