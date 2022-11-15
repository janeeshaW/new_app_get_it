import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/features/domain/entities/response/news_response_entity.dart';



part 'news_response_model.g.dart';

@JsonSerializable()
class NewsResponseModel extends NewsResponse {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "totalResults")
  final int totalResults;
  @JsonKey(name: "articles")
  final List<ArticleModel> articles;

  const NewsResponseModel(
      {required this.status,
        required this.totalResults,
        required this.articles})
      : super(status: status, articles: articles, totalResults: totalResults);

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseModelToJson(this);
}

@JsonSerializable()
class ArticleModel extends Article {
  @JsonKey(name: "source")
  final SourceModel? source;
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "urlToImage")
  final String? urlToImage;
  @JsonKey(name: "publishedAt")
  final DateTime? publishedAt;
  @JsonKey(name: "content")
  final String? content;

  const ArticleModel(
      {this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content})
      : super(
      source: source,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}

@JsonSerializable()
class SourceModel extends Source {
  @JsonKey(name: "id")
  final dynamic id;
  @JsonKey(name: "name")
  final String? name;

  const SourceModel({this.id, this.name}) : super(id: id, name: name);

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);
}

