import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/lecture/data/models/get_info_lecture_res.dart';
import 'package:e_learning/feature/lecture/domain/repo/get_info_lecture_repo.dart';

class GetInfoLecture
    implements UseCase<GetInfoLectureResponse, GetInfoLectureParams> {
  final GetInfoLectureRepository lectureInCourseRepository;

  GetInfoLecture(this.lectureInCourseRepository);

  @override
  Future<Either<Failure, GetInfoLectureResponse>> call(
      GetInfoLectureParams params) async {
    return await lectureInCourseRepository.getInfoLecture(params.idLecture!);
  }
}

class GetInfoLectureParams extends Equatable {
  final int? idLecture;

  GetInfoLectureParams({
    this.idLecture,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        idLecture!,
      ];
}
