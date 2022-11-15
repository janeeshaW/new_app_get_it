import 'package:equatable/equatable.dart';




class SignUpResponseEntity extends Equatable {
  final String success;

  const SignUpResponseEntity({required this.success});

  @override
  List<Object> get props => [success];
}
