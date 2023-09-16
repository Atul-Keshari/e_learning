import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/exercise/data/models/get_exercise_by_id_account_res.dart';
import 'package:e_learning/feature/exercise/data/models/get_info_exercise_res.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_exercise_by_id_account_repo.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_info_exercise_repo.dart';

class GetInfoExercise
    implements UseCase<GetInfoExerciseResponse, GetInfoExerciseParams> {
  final GetInfoExerciseRepository InfoExerciseRepository;

  GetInfoExercise(this.InfoExerciseRepository);

  @override
  Future<Either<Failure, GetInfoExerciseResponse>> call(
      GetInfoExerciseParams params) async {
    return await InfoExerciseRepository.getInfoExercise(
      params.idExercise!,
    );
  }
}

class GetInfoExerciseParams extends Equatable {
  final int? idExercise;

  GetInfoExerciseParams({
    this.idExercise,
  });

  @override
  // TODO: implement props
  List<Object> get props => [idExercise!];
}
