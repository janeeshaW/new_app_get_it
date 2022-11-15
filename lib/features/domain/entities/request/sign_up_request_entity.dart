import 'package:news_app/features/data/models/request/sign_up_request_model.dart';





class SignUpRequestEntity extends SignUpUserRequestModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const SignUpRequestEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  }) : super(
    email: email,
    password: password,
    firstName: firstName,
    lastName: lastName,
  );
}
