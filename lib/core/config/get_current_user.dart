import 'dart:convert';

import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/feature/sign_in/data/models/login_data.dart';
import 'package:e_learning/main.dart';

LoginData getCurrentUser() {
  final loginResponse = prefs?.getString(SAVE_LOGIN_RESPONSE);
  if (loginResponse != null && loginResponse != '') {
    var response = LoginData.fromJson(json.decode(loginResponse));

    return response;
  } else {
    throw CacheException();
  }
}
