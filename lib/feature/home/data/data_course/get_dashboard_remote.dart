import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/feature/home/data/models/get_dashboard_res.dart';
import 'package:e_learning/main.dart';

abstract class GetDashboardRemoteDataSource {
  Future<GetDashboardResponse> getDashboard();
}

class GetDashboardRemoteDataSourceImpl implements GetDashboardRemoteDataSource {
  final http.Client? client;

  GetDashboardRemoteDataSourceImpl({@required this.client});

  @override
  Future<GetDashboardResponse> getDashboard() {
    return _getDashboard();
  }

  Future<GetDashboardResponse> _getDashboard() async {
    final response = await client?.get(
      Uri.parse('$mainUrl/admin/Dashboard'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "auth-token": "${appUser?.token}" // k co header la failed 415
      },
    );
    log("Get GetDashboard: " + "$mainUrl/admin/Dashboard");
    log("Response Json GetDashboard: ${json.decode(response!.body)}");

    if (response.statusCode == 200) {
      var success = GetDashboardResponse.fromJson(json.decode(response.body));

      return success;
    } else {
      throw ServerException();
    }
  }
}
