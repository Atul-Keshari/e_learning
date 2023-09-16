import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/main.dart';

http.Client? client = http.Client();

Future<bool> putTokenAndNewPw(
    {String? email,
    String? newPassword,
    String? token,
    Function? success,
    Function? failure}) async {
  var body = jsonEncode({
    'newPassword': newPassword,
    'token': token,
  });
  final response = await client?.put(
      Uri.parse('$mainUrl/account/NewPasswordAfterForgotPassword?email=$email'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "auth-token": "${appUser?.token}",
        // k co header la failed 415
      },
      body: body);

  log("status putTokenAndNewPw: ${response!.statusCode}");

  if (response.statusCode == 200) {
    success!();
    return true;
  } else {
    failure!();
    throw ServerException();
  }
}
