import 'package:dartz/dartz.dart';
import 'package:news_app/features/domain/entities/request/login_request_entity.dart';
import 'package:news_app/features/domain/entities/request/search_request_entity.dart';
import 'package:news_app/features/domain/entities/request/sign_up_request_entity.dart';
import 'package:news_app/features/domain/entities/response/login_response_entity.dart';
import 'package:news_app/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app/features/domain/entities/response/sign_up_response_entity.dart';

import '../../../core/error/failures.dart';



abstract class Repository {
  Future<Either<Failure, LoginResponseEntity>> getLogIn(
      LoginRequestEntity request);
  Future<Either<Failure, SignUpResponseEntity>> getSignUp(
      SignUpRequestEntity request);
  Future<Either<Failure, LoginResponseEntity>> getLoggedUser();
  Future<Either<Failure, SignUpResponseEntity>> getLoggedOut();
  Future<Either<Failure, NewsResponse>> getAllNews();
  Future<Either<Failure, NewsResponse>> getTopNews();
  Future<Either<Failure, NewsResponse>> getSearchNews(SearchRequestEntity request);


}
