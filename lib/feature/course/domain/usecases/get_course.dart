import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/course/data/models/get_couse_res.dart';
import 'package:e_learning/feature/course/domain/repositories/get_course_repo.dart';

class GetCourse implements UseCase<GetCourseResponse, GetCourseParams> {
  final GetCourseRepository courseContentsRepository;

  GetCourse(this.courseContentsRepository);

  @override
  Future<Either<Failure, GetCourseResponse>> call(
      GetCourseParams params) async {
    return await courseContentsRepository.getCourse(
        params.keySearchNameCourse!, params.idAccount!);
  }
}

class GetCourseParams extends Equatable {
  final String? keySearchNameCourse;
  final String? idAccount;

  GetCourseParams({this.keySearchNameCourse, this.idAccount});

  @override
  // TODO: implement props
  List<Object> get props => [keySearchNameCourse!, idAccount!];
}
