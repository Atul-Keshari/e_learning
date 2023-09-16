import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/feature/class/data/models/get_all_class_response_model.dart';
import 'package:e_learning/feature/home/data/models/get_dashboard_res.dart';
import 'package:e_learning/feature/user/data/models/get_all_teacher_res.dart';

@immutable
abstract class GetAllTeacherState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends GetAllTeacherState {}

class Loading extends GetAllTeacherState {}

class Loaded extends GetAllTeacherState {
  final GetAllTeacherResponse? swagger;
  final List<GetAllTeacherData>? data;

  Loaded({@required this.swagger, @required this.data});

  @override
  List<Object> get props => [swagger!];
}

class Error extends GetAllTeacherState {
  final String? message;

  Error({@required this.message});

  @override
  List<Object> get props => [message!];
}
