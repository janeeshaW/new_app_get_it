import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/features/data/models/request/login_request_model.dart';
import 'package:news_app/features/data/models/request/sign_up_request_model.dart';
import 'package:news_app/features/data/models/response/login_response_model.dart';
import 'package:news_app/features/data/models/response/sign_up_response_model.dart';



var favoritesBox = Hive.box('authBox1');
List<String> books = [];

abstract class LocalDataSource {
  Future<LoginResponseModel> getLogin(LoginRequestModel request);

  Future<SignUpResponseModel> getSignUp(SignUpUserRequestModel request);

  Future<LoginResponseModel> getLoggedUser();

  Future<SignUpResponseModel> getLoggedOut();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<LoginResponseModel> getLogin(LoginRequestModel request) async {
    var box = await Hive.openBox('authBox');
    var loggedUserBox = await Hive.openBox('loggedUserBox');

    try {
      final user = box.get(request.email);
      if (user != null) {
        if (user['email'] == request.email &&
            user['password'] == request.password) {
          await loggedUserBox.put(request.email, {
            'email': request.email,
            'password': request.password,
            'firstname': user['firstname'],
            'lastname': user['lastname']
          });
          return LoginResponseModel(
              success: "success",
              firstName: user['firstname'],
              lastName: user['lastname'],
              email: user['email']);
        } else {
          return const LoginResponseModel(success: "failed");
        }
      } else {
        return const LoginResponseModel(success: "failed");
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<SignUpResponseModel> getSignUp(SignUpUserRequestModel request) async {
    var box = await Hive.openBox('authBox');
    try {
      await box.put(request.email, {
        'email': request.email,
        'password': request.password,
        'firstname': request.firstName,
        'lastname': request.lastName
      });
      return const SignUpResponseModel(success: "success");
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> getLoggedUser() async {
    var loggedUserBox = await Hive.openBox('loggedUserBox');
    try {
      final user = loggedUserBox.getAt(0);
      return LoginResponseModel(
          success: "success",
          firstName: user['firstname'],
          lastName: user['lastname'],
          email: user['email']);
    } catch(e) {
      rethrow;
    }
  }

  @override
  Future<SignUpResponseModel> getLoggedOut() async {
    var loggedUserBox = await Hive.openBox('loggedUserBox');
    try {
      await loggedUserBox.clear();
      return const SignUpResponseModel(success: "success");
    } on Exception {
      rethrow;
    }
  }
}
