import 'package:equatable/equatable.dart';
import 'package:news_app/features/data/models/common/common_error_response_model.dart';



abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

  @override
  List<Object> get props => props;
}

// General failures
class ServerFailure extends Failure {
  final ErrorResponseModel errorResponse;

  const ServerFailure(this.errorResponse);
}

class CacheFailure extends Failure {}

class ConnectionFailure extends Failure {}

class AuthorizedFailure extends Failure {
  final ErrorResponseModel errorResponse;

  const AuthorizedFailure(this.errorResponse);
}
