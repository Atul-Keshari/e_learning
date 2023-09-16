import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/course/data/models/get_point_student_res.dart';
import 'package:e_learning/feature/course/domain/repositories/get_point_student_repo.dart';

class GetPointStudent
    implements UseCase<GetPointStudentResponse, GetPointStudentParams> {
  final GetPointStudentRepository getPointStudentRepository;

  GetPointStudent(this.getPointStudentRepository);

  @override
  Future<Either<Failure, GetPointStudentResponse>> call(
      GetPointStudentParams params) async {
    return await getPointStudentRepository.getPointStudent(
        params.idCourse!, params.idAccount!);
  }
}

class GetPointStudentParams extends Equatable {
  final String? idCourse;
  final int? idAccount;
  GetPointStudentParams({this.idCourse, this.idAccount});

  @override
  // TODO: implement props
  List<Object> get props => [
        idCourse!,
      ];
}
