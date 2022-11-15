import 'package:news_app/features/data/models/common/common_error_response_model.dart';
import 'package:news_app/features/domain/entities/common/common_error_response_entity.dart';

abstract class BaseState<K> {
  const BaseState();
}

class BaseInitial extends BaseState {}

class SessionExpireState<K> extends BaseState<K> {}

class APIFailureState<K> extends BaseState<K> {
  final ErrorResponseEntity errorResponseModel;

  APIFailureState({required this.errorResponseModel});
}

class APILoadingState<K> extends BaseState<K> {}

class LogoutSuccessState<K> extends BaseState<K> {}
