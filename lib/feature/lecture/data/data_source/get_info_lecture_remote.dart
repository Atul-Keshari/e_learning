import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';
import 'package:e_learning/feature/lecture/data/models/get_info_lecture_res.dart';
import 'package:e_learning/main.dart';

abstract class GetInfoLectureRemoteDataSource {
  Future<GetInfoLectureResponse> getInfoLecture(int idLecture);
}

class GetInfoLectureRemoteDataSourceImpl
    implements GetInfoLectureRemoteDataSource {
  final http.Client? client;

  GetInfoLectureRemoteDataSourceImpl({this.client});

  @override
  Future<GetInfoLectureResponse> getInfoLecture(int idLecture) {
    return _getInfoLecture(
      idLecture,
    );
  }

  Future<GetInfoLectureResponse> _getInfoLecture(
    int idLecture,
  ) async {
    final response = await client!.get(
      Uri.parse('$mainUrl/lecture/GetInformationLecture/$idLecture'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json", // k co header la failed 415
        //'Content-Type': 'application/x-www-form-urlencoded'
        "auth-token": "${appUser?.token}"
      },
    );

    log("Get GetInfoLectureResponse: " +
        '$mainUrl/lecture/GetInformationLecture/$idLecture');
    log("Response Json GetInfoLectureResponse: ${json.decode(response.body)}");

    if (response.statusCode == 200) {
      var success = GetInfoLectureResponse.fromJson(json.decode(response.body));

      return success;
    } else {
      throw ServerException();
    }
  }
}
