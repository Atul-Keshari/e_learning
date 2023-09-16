import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/feature/course/data/models/get_couse_res.dart';

abstract class GetCourseRemoteDataSource {
  Future<GetCourseResponse> getCourse(
      String keySearchNameCourse, String idAccount);
}

class GetCourseRemoteDataSourceImpl implements GetCourseRemoteDataSource {
  final http.Client? client;

  GetCourseRemoteDataSourceImpl({this.client});

  @override
  Future<GetCourseResponse> getCourse(
      String keySearchNameCourse, String idAccount) {
    return _getCourse(keySearchNameCourse, idAccount);
  }

  Future<GetCourseResponse> _getCourse(
      String keySearchNameCourse, String idAccount) async {
    final response = await client!.get(
      Uri.parse('$mainUrl/course/GetCourse$keySearchNameCourse$idAccount'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json" // k co header la failed 415
      },
    );
    log("url : $mainUrl/course/GetCourse$keySearchNameCourse$idAccount");
    log("Get GetCourseResponse: " + "${response.statusCode}");
    log("Get GetCourseResponse: " + "${json.decode(response.body)}");

    if (response.statusCode == 200) {
      var success = GetCourseResponse.fromJson(json.decode(response.body));

      return success;
    } else {
      throw ServerException();
    }
  }
}
