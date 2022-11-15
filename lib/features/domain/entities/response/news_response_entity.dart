import 'package:equatable/equatable.dart';



class NewsResponse extends Equatable {
  const NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<Article> articles;

  @override
  List<Object> get props => [status, totalResults, articles];
}

class Article extends Equatable {
  const Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  @override
  List<Object> get props => [
        source!,
        author!,
        title!,
        description!,
        url!,
        urlToImage!,
        publishedAt!,
        content!
      ];
}

class Source extends Equatable {
  const Source({
    this.id,
    this.name,
  });

  final dynamic id;
  final String? name;

  @override
  List<Object> get props => [id, name!];
}
