import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';
import 'package:e_learning/feature/course/domain/repositories/get_member_in_course_repo.dart';

class GetMemberInCourse
    implements UseCase<GetMemberInCourseResponse, GetMemberInCourseParams> {
  final GetMemberInCourseRepository memberInCourseRepository;

  GetMemberInCourse(this.memberInCourseRepository);

  @override
  Future<Either<Failure, GetMemberInCourseResponse>> call(
      GetMemberInCourseParams params) async {
    return await memberInCourseRepository.getMemberInCourse(
        params.idCourse!, params.keySearchName!);
  }
}

class GetMemberInCourseParams extends Equatable {
  final String? idCourse;
  final String? keySearchName;

  GetMemberInCourseParams({this.idCourse, this.keySearchName});

  @override
  // TODO: implement props
  List<Object> get props => [idCourse!, keySearchName!];
}
