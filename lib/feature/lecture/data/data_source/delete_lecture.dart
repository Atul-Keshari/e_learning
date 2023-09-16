import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/main.dart';

http.Client? client = http.Client();

Future<bool> removeLecture(
    {int? idLecture, Function? success, Function? failure}) async {
  var body = jsonEncode({
    'idLecture': idLecture,
  });
  final response = await client?.delete(
      Uri.parse('$mainUrl/lecture/DeleteLecture/$idLecture'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "auth-token": "${appUser?.token}",
        // k co header la failed 415
      },
      body: body);
  log("delete removeLecture: " + "$mainUrl/lecture/DeleteLecture/$idLecture");
  log("delete body removeLecture: " + body);
  log("Response Json removeLecture: ${json.decode(response!.body)}");

  if (response.statusCode == 200) {
    success!();
    return true;
  } else {
    failure!();
    throw ServerException();
  }
}
