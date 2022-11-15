import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/features/domain/entities/response/sign_up_response_entity.dart';




part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel extends SignUpResponseEntity {
  @JsonKey(name: "success")
  final String success;

  const SignUpResponseModel({required this.success}) : super(success: success);

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}
