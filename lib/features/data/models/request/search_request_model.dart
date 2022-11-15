import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'search_request_model.g.dart';

@JsonSerializable()
class SearchRequestModel extends Equatable {
  @JsonKey(name: "searchTerm")
  final String searchTerm;

  const SearchRequestModel({required this.searchTerm});

  @override
  List<Object> get props => [searchTerm];

  factory SearchRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRequestModelToJson(this);
}
