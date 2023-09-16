import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/exercise/data/models/get_exercise_by_course_res.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_exercise_by_course_repo.dart';

class GetExerciseByCourse
    implements UseCase<GetExerciseByCourseResponse, GetExerciseByCourseParams> {
  final GetExerciseByCourseRepository exerciseByCourseRepository;

  GetExerciseByCourse(this.exerciseByCourseRepository);

  @override
  Future<Either<Failure, GetExerciseByCourseResponse>> call(
      GetExerciseByCourseParams params) async {
    return await exerciseByCourseRepository.getExerciseByCourse(
      params.idCourse!,
    );
  }
}

class GetExerciseByCourseParams extends Equatable {
  final String? idCourse;

  GetExerciseByCourseParams({
    this.idCourse,
  });

  @override
  // TODO: implement props
  List<Object> get props => [idCourse!];
}
