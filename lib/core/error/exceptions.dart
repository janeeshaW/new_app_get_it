import 'package:news_app/features/data/models/common/common_error_response_model.dart';


class ServerException implements Exception {
  final ErrorResponseModel errorResponseModel;

  ServerException(this.errorResponseModel);
}

class CacheException implements Exception {}

class UnAuthorizedException implements Exception {
  final ErrorResponseModel errorResponseModel;

  UnAuthorizedException(this.errorResponseModel);
}

class DioException implements Exception {
  final ErrorResponseModel errorResponseModel;

  DioException({required this.errorResponseModel});
}
