import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/feature/exercise/data/models/get_exercise_by_id_account_res.dart';
import 'package:e_learning/feature/exercise/data/models/get_info_exercise_res.dart';
import 'package:e_learning/main.dart';

abstract class GetInfoExerciseRemoteDataSource {
  Future<GetInfoExerciseResponse> getInfoExercise(int idExercise);
}

class GetInfoExerciseRemoteDataSourceImpl
    implements GetInfoExerciseRemoteDataSource {
  final http.Client? client;

  GetInfoExerciseRemoteDataSourceImpl({@required this.client});

  @override
  Future<GetInfoExerciseResponse> getInfoExercise(int idExercise) {
    return _getInfoExercise(idExercise);
  }

  Future<GetInfoExerciseResponse> _getInfoExercise(int idExercise) async {
    final response = await client?.get(
      Uri.parse('$mainUrl/exercise/GetInformationExercise/$idExercise'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json", // k co header la failed 415
        "auth-token": "${appUser?.token}",
      },
    );
    log("Get GetInfoExercise: " +
        "$mainUrl/exercise/GetInformationExercise/$idExercise");
    log("Response Json GetInfoExercise: ${json.decode(response!.body)}");

    if (response.statusCode == 200) {
      var success =
          GetInfoExerciseResponse.fromJson(json.decode(response.body));

      return success;
    } else {
      throw ServerException();
    }
  }
}
