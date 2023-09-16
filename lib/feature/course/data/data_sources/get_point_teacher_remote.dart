import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/feature/course/data/models/get_member_in_course_res.dart';
import 'package:e_learning/feature/course/data/models/get_point_teacher_res.dart';
import 'package:e_learning/main.dart';

abstract class GetPointTeacherRemoteDataSource {
  Future<GetPointTeacherResponse> getPointTeacher(
    String idCourse,
  );
}

class GetPointTeacherRemoteDataSourceImpl
    implements GetPointTeacherRemoteDataSource {
  final http.Client? client;

  GetPointTeacherRemoteDataSourceImpl({this.client});

  @override
  Future<GetPointTeacherResponse> getPointTeacher(
    String idCourse,
  ) {
    return _getPointTeacher(idCourse);
  }

  Future<GetPointTeacherResponse> _getPointTeacher(
    String idCourse,
  ) async {
    final response = await client!.get(
      Uri.parse('$mainUrl/course/GetPointCourseForTeacher?idCourse=$idCourse'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json", // k co header la failed 415
        "auth-token": "${appUser?.token}"
      },
    );

    log("Get GetPointTeacherResponse: " +
        '$mainUrl/course/GetPointCourseForTeacher?idCourse=$idCourse');
    log("Response Json GetPointTeacherResponse: ${json.decode(response.body)}");

    if (response.statusCode == 200) {
      var success =
          GetPointTeacherResponse.fromJson(json.decode(response.body));

      return success;
    } else {
      throw ServerException();
    }
  }
}
