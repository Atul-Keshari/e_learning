import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/feature/class/data/models/get_all_class_response_model.dart';
import 'package:e_learning/feature/user/data/models/get_all_teacher_res.dart';

abstract class GetAllTeacherRemoteDataSource {
  Future<GetAllTeacherResponse> getAllTeacher();
}

class GetAllTeacherRemoteDataSourceImpl
    implements GetAllTeacherRemoteDataSource {
  final http.Client? client;

  GetAllTeacherRemoteDataSourceImpl({@required this.client});

  @override
  Future<GetAllTeacherResponse> getAllTeacher() {
    return _getAllTeacher();
  }

  Future<GetAllTeacherResponse> _getAllTeacher() async {
    final response = await client?.get(
      Uri.parse('$mainUrl/account/GetTeacher'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json" // k co header la failed 415
      },
    );
    log("Get GetAllTeacher: " + "$mainUrl/account/GetTeacher");
    log("Response Json GetAllTeacher: ${json.decode(response!.body)}");

    if (response.statusCode == 200) {
      var success = GetAllTeacherResponse.fromJson(json.decode(response.body));

      return success;
    } else {
      throw ServerException();
    }
  }
}
