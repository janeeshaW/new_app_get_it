import 'package:news_app/core/configuration/network/api_helper.dart';
import 'package:news_app/core/configuration/network/network_config.dart';
import 'package:news_app/features/data/models/request/search_request_model.dart';
import 'package:news_app/features/data/models/response/news_response_model.dart';



abstract class RemoteDataSource {
  Future<NewsResponseModel> getAllNews();
  Future<NewsResponseModel> getTopNews();
  Future<NewsResponseModel> getSearchNews(SearchRequestModel request);

}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiHelper apiHelper;

  RemoteDataSourceImpl({required this.apiHelper});


  @override
  Future<NewsResponseModel> getAllNews() async {
    try {
      final response = await apiHelper.getWithQParam('everything', {
        "q": "tesla",
        "from": "2022-11-03",
        "sortBy": "publishedAt",
        "apiKey": NetworkConfig.APIKey
      });
      return NewsResponseModel.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<NewsResponseModel> getTopNews() async {
    try {
      final response = await apiHelper.getWithQParam(
          'top-headlines', {"country": "us", "apiKey": NetworkConfig.APIKey});
      return NewsResponseModel.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<NewsResponseModel> getSearchNews(SearchRequestModel request) async {
    try {
      final response = await apiHelper.getWithQParam('everything', {
        "q": request.searchTerm,
        "from": "2022-11-03",
        "sortBy": "publishedAt",
        "apiKey": NetworkConfig.APIKey
      });
      return NewsResponseModel.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }
}
