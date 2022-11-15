import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/configuration/network/api_helper.dart';
import 'package:news_app/core/configuration/network/network_info.dart';
import 'package:news_app/core/util/app_data_conversions.dart';
import 'package:news_app/core/util/app_validations.dart';
import 'package:news_app/features/data/dataSources/local_data_source.dart';
import 'package:news_app/features/data/dataSources/remote_data_source.dart';
import 'package:news_app/features/data/repository/repository_impl.dart';
import 'package:news_app/features/domain/repository/repository.dart';
import 'package:news_app/features/domain/usecases/get_all_news_use_case.dart';
import 'package:news_app/features/domain/usecases/get_logged_out_use_case.dart';
import 'package:news_app/features/domain/usecases/get_logged_user_use_case.dart';
import 'package:news_app/features/domain/usecases/get_login_use_case.dart';
import 'package:news_app/features/domain/usecases/get_search_news_use_case.dart';
import 'package:news_app/features/domain/usecases/get_sign_up_use_case.dart';
import 'package:news_app/features/domain/usecases/get_top_news_use_case.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:news_app/features/presentation/bloc/home/home_bloc.dart';



final injection = GetIt.instance;

Future<void> setupLocator() async {
  injection.registerSingleton(Dio());
  injection.registerLazySingleton<ApiHelper>(() => ApiHelper());
  injection
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injection()));
  injection.registerLazySingleton(() => ConnectivityWrapper.instance);
  injection.registerSingleton(AppValidations());
  injection.registerSingleton(AppDataConversions());

  ///Repository
  injection.registerLazySingleton<Repository>(
    () => RepositoryImpl(
        remoteDataSource: injection(),
        localDataSource: injection(),
        networkInfo: injection()),
  );

  ///Data sources
  injection.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(apiHelper: injection()),
  );
  injection.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );

  ///Use cases
  injection.registerLazySingleton(() => GetLoginUseCase(injection()));
  injection.registerLazySingleton(() => GetSignUpUseCase(injection()));
  injection.registerLazySingleton(() => GetLoggedUserUseCase(injection()));
  injection.registerLazySingleton(() => GetLoggedOutUseCase(injection()));
  injection.registerLazySingleton(() => GetAllNewsUseCase(injection()));
  injection.registerLazySingleton(() => GetTopNewsUseCase(injection()));
  injection.registerLazySingleton(() => GetSearchNewsUseCase(injection()));

  ///Bloc
  injection.registerFactory(
    () => AuthBloc(
        getSignUpUseCase: injection(),
        getLoginUseCase: injection(),
        getLoggedUserUseCase: injection(),
        getLoggedOutUseCase: injection()),
  );
  injection.registerFactory(
    () => HomeBloc(
        getAllNewsUseCase: injection(),
        getTopNewsUseCase: injection(),
        getSearchNewsUseCase: injection()),
  );
}
