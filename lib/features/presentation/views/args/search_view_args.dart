import 'package:news_app/features/domain/entities/response/news_response_entity.dart';



class SearchViewArgs{
  final NewsResponse news;
  final String searchedText;

  SearchViewArgs({required this.news, required this.searchedText});
}
