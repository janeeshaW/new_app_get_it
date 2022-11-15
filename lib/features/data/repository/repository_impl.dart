import 'package:dartz/dartz.dart';
import 'package:news_app/core/configuration/network/network_info.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/error/messages.dart';
import 'package:news_app/features/data/dataSources/local_data_source.dart';
import 'package:news_app/features/data/dataSources/remote_data_source.dart';
import 'package:news_app/features/data/models/common/common_error_response_model.dart';
import 'package:news_app/features/data/models/request/login_request_model.dart';
import 'package:news_app/features/data/models/request/search_request_model.dart';
import 'package:news_app/features/data/models/request/sign_up_request_model.dart';
import 'package:news_app/features/data/models/response/login_response_model.dart';
import 'package:news_app/features/data/models/response/news_response_model.dart';
import 'package:news_app/features/data/models/response/sign_up_response_model.dart';
import 'package:news_app/features/domain/entities/response/sign_up_response_entity.dart';
import 'package:news_app/features/domain/repository/repository.dart';




class RepositoryImpl implements Repository{
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginResponseModel>> getLogIn(
      LoginRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await localDataSource.getLogin(request);
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return const Left(ServerFailure(
            ErrorResponseModel(responseError: ErrorMessages.SOMETHING_WRONG)));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
  @override
  Future<Either<Failure, SignUpResponseModel>> getSignUp(
      SignUpUserRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await localDataSource.getSignUp(request);
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return const Left(ServerFailure(
            ErrorResponseModel(responseError: ErrorMessages.SOMETHING_WRONG)));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, LoginResponseModel>> getLoggedUser() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await localDataSource.getLoggedUser();
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return const Left(ServerFailure(
            ErrorResponseModel(responseError: ErrorMessages.SOMETHING_WRONG)));
      } catch (e) {
        return const Left(ServerFailure(ErrorResponseModel(responseError: ErrorMessages.SOMETHING_WRONG)));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, SignUpResponseEntity>> getLoggedOut() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await localDataSource.getLoggedOut();
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return const Left(ServerFailure(
            ErrorResponseModel(responseError: ErrorMessages.SOMETHING_WRONG)));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, NewsResponseModel>> getAllNews() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getAllNews();
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return const Left(ServerFailure(
            ErrorResponseModel(responseError: ErrorMessages.SOMETHING_WRONG)));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, NewsResponseModel>> getTopNews() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getTopNews();
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return const Left(ServerFailure(
            ErrorResponseModel(responseError: ErrorMessages.SOMETHING_WRONG)));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, NewsResponseModel>> getSearchNews(
      SearchRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getSearchNews(request);
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return const Left(ServerFailure(
            ErrorResponseModel(responseError: ErrorMessages.SOMETHING_WRONG)));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
