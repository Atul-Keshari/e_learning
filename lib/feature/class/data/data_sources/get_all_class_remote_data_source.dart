import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/feature/class/data/models/get_all_class_response_model.dart';

abstract class GetAllClassRemoteDataSource {
  Future<GetAllClassResponseModel> getAllClass();
}

class GetAllClassRemoteDataSourceImpl implements GetAllClassRemoteDataSource {
  final http.Client? client;

  GetAllClassRemoteDataSourceImpl({@required this.client});

  @override
  Future<GetAllClassResponseModel> getAllClass() {
    return _getAllClass();
  }

  Future<GetAllClassResponseModel> _getAllClass() async {
    final response = await client?.get(
      Uri.parse('$mainUrl/class/GetAllClass'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json" // k co header la failed 415
      },
    );
    log("Get GetAllClass: " + "$mainUrl/class/GetAllClass");
    log("Response Json GetAllClass: ${json.decode(response!.body)}");

    if (response.statusCode == 200) {
      var success =
          GetAllClassResponseModel.fromJson(json.decode(response.body));

      return success;
    } else {
      throw ServerException();
    }
  }
}
