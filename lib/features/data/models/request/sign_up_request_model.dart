import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';



part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpUserRequestModel extends Equatable {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;

  const SignUpUserRequestModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object> get props => [email, password, firstName, lastName];

  factory SignUpUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpUserRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpUserRequestModelToJson(this);
}
