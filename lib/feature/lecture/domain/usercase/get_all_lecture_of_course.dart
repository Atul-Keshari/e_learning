import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';
import 'package:e_learning/feature/course/domain/repositories/get_member_in_course_repo.dart';
import 'package:e_learning/feature/lecture/data/models/get_all_lecture_of_course_res.dart';
import 'package:e_learning/feature/lecture/domain/repo/get_all_lecture_of_course_repo.dart';

class GetAllLecture
    implements UseCase<GetAllLectureResponse, GetAllLectureParams> {
  final GetAllLectureRepository lectureInCourseRepository;

  GetAllLecture(this.lectureInCourseRepository);

  @override
  Future<Either<Failure, GetAllLectureResponse>> call(
      GetAllLectureParams params) async {
    return await lectureInCourseRepository.getAllLecture(params.idCourse!);
  }
}

class GetAllLectureParams extends Equatable {
  final String? idCourse;

  GetAllLectureParams({
    this.idCourse,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        idCourse!,
      ];
}
