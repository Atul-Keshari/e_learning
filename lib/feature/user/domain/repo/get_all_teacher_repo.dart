import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/class/data/models/get_all_class_response_model.dart';
import 'package:e_learning/feature/user/data/models/get_all_teacher_res.dart';

abstract class GetAllTeacherRepository {
  Future<Either<Failure, GetAllTeacherResponse>> getAllTeacher();
}
