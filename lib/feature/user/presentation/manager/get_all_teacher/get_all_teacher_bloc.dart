import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/core/usecase/usecase.dart';
import 'package:e_learning/feature/user/data/models/get_all_teacher_res.dart';
import 'package:e_learning/feature/user/domain/usecase/get_all_teacher.dart';
import 'package:e_learning/feature/user/presentation/manager/get_all_teacher/get_all_teacher_event.dart';
import 'package:e_learning/feature/user/presentation/manager/get_all_teacher/get_all_teacher_state.dart';

class GetAllTeacherBloc extends Bloc<GetAllTeacherEvent, GetAllTeacherState> {
  final GetAllTeacher? getGetAllTeacher;

  GetAllTeacherBloc({@required GetAllTeacher? pr})
      : assert(pr != null),
        getGetAllTeacher = pr,
        super(Empty());

  GetAllTeacherState get initialState => Empty();

  @override
  Stream<GetAllTeacherState> mapEventToState(GetAllTeacherEvent event) async* {
    if (event is GetAllTeacherE) {
      yield Loading();
      final failureOrSuccess = await getGetAllTeacher!(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }
  }

  Stream<GetAllTeacherState> _eitherLoadedOrErrorState(
      Either<Failure, GetAllTeacherResponse> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (res) => Loaded(swagger: res, data: res.data),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
