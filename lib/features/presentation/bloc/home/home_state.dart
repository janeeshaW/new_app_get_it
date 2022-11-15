import 'package:news_app/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app/features/presentation/bloc/base_state.dart';

abstract class HomeState extends BaseState<HomeState> {}

class InitialHomeState extends HomeState {}

class GetAllNewsSuccessState extends HomeState {
  final NewsResponse responseEntity;

  GetAllNewsSuccessState(this.responseEntity);
}

class GetTopNewsSuccessState extends HomeState {
  final NewsResponse responseEntity;

  GetTopNewsSuccessState(this.responseEntity);
}

class GetSearchNewsSuccessState extends HomeState {
  final NewsResponse responseEntity;

  GetSearchNewsSuccessState(this.responseEntity);
}
