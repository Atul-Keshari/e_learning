import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';
import 'package:e_learning/feature/lecture/data/models/get_info_lecture_res.dart';

abstract class GetInfoLectureRepository {
  Future<Either<Failure, GetInfoLectureResponse>> getInfoLecture(int idLecture);
}
