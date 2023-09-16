import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/main.dart';

http.Client? client = http.Client();

Future<bool> removeClass(
    {int? idClass, Function? success, Function? failure}) async {
  final response = await client?.delete(
    Uri.parse('$mainUrl/class/DeleteClass/$idClass '),
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      "auth-token": "${appUser?.token}",
      // k co header la failed 415
    },
  );

  log("Response Json removeClass: ${json.decode(response!.body)}");

  if (response.statusCode == 200) {
    success!();
    return true;
  } else {
    failure!();
    throw ServerException();
  }
}
