import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app/features/domain/repository/repository.dart';




class GetAllNewsUseCase extends UseCase<NewsResponse, NoParams> {
  final Repository repository;

  GetAllNewsUseCase(this.repository);

  @override
  Future<Either<Failure, NewsResponse>> call(NoParams params) async {
    return await repository.getAllNews();
  }
}
