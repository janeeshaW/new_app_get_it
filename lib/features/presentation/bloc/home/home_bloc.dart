import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/domain/entities/common/common_error_response_entity.dart';
import 'package:news_app/features/domain/usecases/get_all_news_use_case.dart';
import 'package:news_app/features/domain/usecases/get_search_news_use_case.dart';
import 'package:news_app/features/domain/usecases/get_top_news_use_case.dart';
import 'package:news_app/features/presentation/bloc/base_bloc.dart';
import 'package:news_app/features/presentation/bloc/base_state.dart';
import 'package:news_app/features/presentation/bloc/home/home_event.dart';
import 'package:news_app/features/presentation/bloc/home/home_state.dart';

class HomeBloc extends Base<HomeEvent, BaseState<HomeState>> {
  final GetAllNewsUseCase getAllNewsUseCase;
  final GetTopNewsUseCase getTopNewsUseCase;
  final GetSearchNewsUseCase getSearchNewsUseCase;
  HomeBloc({
    required this.getAllNewsUseCase,
    required this.getTopNewsUseCase,
    required this.getSearchNewsUseCase,
  }) : super(InitialHomeState()){
    on<GetAllNewsEvent>((event, emit) async {
      emit(APILoadingState());
      final failureOrSuccess = await getAllNewsUseCase(NoParams());
      failureOrSuccess.fold(
              (failure) => emit(APIFailureState(
              errorResponseModel: const ErrorResponseEntity(
                  responseCode: "Failed", responseError: "ApI Failed"))),
              (success) => emit(GetAllNewsSuccessState(success)));
    });
    on<GetTopNewsEvent>((event, emit) async {
      emit(APILoadingState());
      final failureOrSuccess = await getTopNewsUseCase(NoParams());
      failureOrSuccess.fold(
              (failure) => emit(APIFailureState(
              errorResponseModel: const ErrorResponseEntity(
                  responseCode: "Failed", responseError: "ApI Failed"))),
              (success) => emit(GetTopNewsSuccessState(success)));
    });
    on<GetSearchNewsEvent>((event, emit) async {
      emit(APILoadingState());
      final failureOrSuccess = await getSearchNewsUseCase(
          GetSearchNewsParameters(request: event.request));
      failureOrSuccess.fold(
              (failure) => emit(APIFailureState(
              errorResponseModel: const ErrorResponseEntity(
                  responseCode: "Failed", responseError: "ApI Failed"))),
              (success) => emit(GetSearchNewsSuccessState(success)));
    });
  }
}
