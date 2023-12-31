import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/list_teacher/data/models/list_teacher_response_model.dart';

abstract class ListTeacherRepository {
  Future<Either<Failure, ListTeacherResponseModel>> getListTeacher();
}
