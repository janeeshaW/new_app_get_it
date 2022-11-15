import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/features/domain/entities/common/common_error_response_entity.dart';
part 'common_error_response_model.g.dart';





@JsonSerializable()
class ErrorResponseModel extends ErrorResponseEntity {
  const ErrorResponseModel({
    this.responseCode,
    this.responseError,
  }) : super(responseCode: responseCode, responseError: responseError);

  @JsonKey(name: 'response_code')
  final String? responseCode;
  @JsonKey(name: 'response_error')
  final String? responseError;

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);
}
