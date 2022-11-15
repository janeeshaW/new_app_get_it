import 'package:news_app/features/data/models/request/search_request_model.dart';




class SearchRequestEntity extends SearchRequestModel {
  final String searchTerm;

  const SearchRequestEntity({
    required this.searchTerm,
  }) : super(
    searchTerm: searchTerm,
  );
}
