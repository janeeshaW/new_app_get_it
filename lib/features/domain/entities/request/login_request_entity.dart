import 'package:news_app/features/data/models/request/login_request_model.dart';




class LoginRequestEntity extends LoginRequestModel {
  final String email;
  final String password;

  const LoginRequestEntity({
    required this.email,
    required this.password,
  }) : super(
    email: email,
    password: password,
  );
}
