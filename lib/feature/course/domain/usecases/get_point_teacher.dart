import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';
import 'package:e_learning/feature/course/data/models/get_point_teacher_res.dart';
import 'package:e_learning/feature/course/domain/repositories/get_member_in_course_repo.dart';
import 'package:e_learning/feature/course/domain/repositories/get_point_teacher_repo.dart';

class GetPointTeacher
    implements UseCase<GetPointTeacherResponse, GetPointTeacherParams> {
  final GetPointTeacherRepository memberInCourseRepository;

  GetPointTeacher(this.memberInCourseRepository);

  @override
  Future<Either<Failure, GetPointTeacherResponse>> call(
      GetPointTeacherParams params) async {
    return await memberInCourseRepository.getPointTeacher(
      params.idCourse!,
    );
  }
}

class GetPointTeacherParams extends Equatable {
  final String? idCourse;

  GetPointTeacherParams({
    this.idCourse,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        idCourse!,
      ];
}
