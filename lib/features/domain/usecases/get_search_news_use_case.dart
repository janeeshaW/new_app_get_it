import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/domain/entities/request/search_request_entity.dart';
import 'package:news_app/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app/features/domain/repository/repository.dart';


class GetSearchNewsUseCase
    extends UseCase<NewsResponse, GetSearchNewsParameters> {
  final Repository repository;

  GetSearchNewsUseCase(this.repository);

  @override
  Future<Either<Failure, NewsResponse>> call(
      GetSearchNewsParameters params) async {
    return await repository.getSearchNews(params.request);
  }
}

class GetSearchNewsParameters extends Equatable {
  final SearchRequestEntity request;

  const GetSearchNewsParameters({required this.request});

  @override
  List<Object> get props => [request];
}
