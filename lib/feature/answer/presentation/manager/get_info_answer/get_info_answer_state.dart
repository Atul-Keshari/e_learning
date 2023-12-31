import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/feature/answer/data/models/get_info_answer_res.dart';

@immutable
abstract class GetInformationAnswerState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends GetInformationAnswerState {}

class Loading extends GetInformationAnswerState {}

class Loaded extends GetInformationAnswerState {
  final GetInformationAnswerResponse? swagger;

  Loaded({
    @required this.swagger,
  });

  @override
  List<Object> get props => [swagger!];
}

class Error extends GetInformationAnswerState {
  final String? message;

  Error({@required this.message});

  @override
  List<Object> get props => [message!];
}
