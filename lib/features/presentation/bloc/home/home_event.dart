import 'package:news_app/features/domain/entities/request/search_request_entity.dart';
import 'package:news_app/features/presentation/bloc/base_event.dart';

abstract class HomeEvent extends BaseEvent {}

class GetAllNewsEvent extends HomeEvent {}

class GetTopNewsEvent extends HomeEvent {}

class GetSearchNewsEvent extends HomeEvent {
  final SearchRequestEntity request;

  GetSearchNewsEvent({required this.request});
}
