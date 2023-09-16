import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/main.dart';

http.Client? client = http.Client();

Future<bool> removeExercise(
    {int? idExercise, Function? success, Function? failure}) async {
  var body = jsonEncode({
    'idExercise': idExercise,
  });
  final response = await client?.delete(
      Uri.parse('$mainUrl/exercise/DeleteExercise/$idExercise'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "auth-token": "${appUser?.token}",
        // k co header la failed 415
      },
      body: body);
  log("delete removeExercise: " +
      "$mainUrl/exercise/DeleteExercise/$idExercise");
  log("delete body removeExercise: " + body);
  log("Response Json removeExercise: ${json.decode(response!.body)}");

  if (response.statusCode == 200) {
    success!();
    return true;
  } else {
    failure!();
    throw ServerException();
  }
}
