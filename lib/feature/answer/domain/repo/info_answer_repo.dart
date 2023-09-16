import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/answer/data/models/get_info_answer_res.dart';

abstract class GetInformationAnswerRepository {
  Future<Either<Failure, GetInformationAnswerResponse>> getInformationAnswer(
      int idAccount, int idAnswer);
}
