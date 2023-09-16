import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failures.dart';
import 'package:e_learning/feature/sign_in/data/models/login_data.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginData>> postLogin(String email, String pass);
  Future<Either<Failure, LoginData>> getCurrentUser();
}
