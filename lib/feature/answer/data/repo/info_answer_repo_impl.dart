import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/answer/data/data_course/get_info_answer_remote.dart';
import 'package:e_learning/feature/answer/data/models/get_info_answer_res.dart';
import 'package:e_learning/feature/answer/domain/repo/info_answer_repo.dart';

class GetInformationAnswerRepositoryImpl
    extends GetInformationAnswerRepository {
  final NetworkInfo? networkInfo;
  final GetInformationAnswerRemoteDataSource?
      getInformationAnswerRemoteDataSource;

  GetInformationAnswerRepositoryImpl({
    this.networkInfo,
    this.getInformationAnswerRemoteDataSource,
  });

  @override
  Future<Either<Failure, GetInformationAnswerResponse>> getInformationAnswer(
      int idAccount, int idAnswer) {
    return _infoAnswer(getInformationAnswerRemoteDataSource!
        .getInformationAnswer(idAccount, idAnswer));
  }

  Future<Either<Failure, GetInformationAnswerResponse>> _infoAnswer(
      Future<GetInformationAnswerResponse> getInformationAnswer) async {
    if (await networkInfo!.isConnected) {
      try {
        final info = await getInformationAnswer;
        return Right(info);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
