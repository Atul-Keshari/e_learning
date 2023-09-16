import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/answer/data/models/get_info_answer_res.dart';
import 'package:e_learning/feature/answer/domain/repo/info_answer_repo.dart';

class GetInformationAnswer
    implements
        UseCase<GetInformationAnswerResponse, GetInformationAnswerParams> {
  final GetInformationAnswerRepository getInformationAnswerRepository;

  GetInformationAnswer(this.getInformationAnswerRepository);

  @override
  Future<Either<Failure, GetInformationAnswerResponse>> call(
      GetInformationAnswerParams params) async {
    return await getInformationAnswerRepository.getInformationAnswer(
        params.idAccount!, params.idAnswer!);
  }
}

class GetInformationAnswerParams extends Equatable {
  final int? idAccount;
  final int? idAnswer;

  GetInformationAnswerParams({this.idAnswer, this.idAccount});

  @override
  List<Object> get props => [idAnswer!, idAccount!];
}
