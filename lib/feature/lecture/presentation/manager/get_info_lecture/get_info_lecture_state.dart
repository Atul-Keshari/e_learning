import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';
import 'package:e_learning/feature/lecture/data/models/get_info_lecture_res.dart';

@immutable
abstract class GetInfoLectureState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends GetInfoLectureState {}

class Loading extends GetInfoLectureState {}

class Loaded extends GetInfoLectureState {
  final GetInfoLectureResponse? swagger;
  final GetInfoLectureData? data;

  Loaded({@required this.swagger, @required this.data});

  @override
  List<Object> get props => [swagger!];
}

class Error extends GetInfoLectureState {
  final String? message;

  Error({@required this.message});

  @override
  List<Object> get props => [message!];
}
