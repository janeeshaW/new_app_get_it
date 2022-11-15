import 'package:equatable/equatable.dart';



class LoginResponseEntity extends Equatable {
  final String success;
  final String? firstName;
  final String? lastName;
  final String? email;

  const LoginResponseEntity({
    required this.success,
    this.firstName,
    this.lastName,
    this.email,
  });

  @override
  List<Object> get props => [success, firstName!, lastName!, email!];
}
