import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/domain/entities/common/common_error_response_entity.dart';
import 'package:news_app/features/domain/usecases/get_logged_out_use_case.dart';
import 'package:news_app/features/domain/usecases/get_logged_user_use_case.dart';
import 'package:news_app/features/domain/usecases/get_login_use_case.dart';
import 'package:news_app/features/domain/usecases/get_sign_up_use_case.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_event.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_state.dart';
import 'package:news_app/features/presentation/bloc/base_bloc.dart';

import '../base_state.dart';

class AuthBloc extends Base<AuthEvent, BaseState<AuthState>> {
  final GetLoginUseCase getLoginUseCase;
  final GetSignUpUseCase getSignUpUseCase;
  final GetLoggedUserUseCase getLoggedUserUseCase;
  final GetLoggedOutUseCase getLoggedOutUseCase;

  AuthBloc({
    required this.getLoginUseCase,
    required this.getSignUpUseCase,
    required this.getLoggedUserUseCase,
    required this.getLoggedOutUseCase,
  }) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(APILoadingState());
      final failureOrSuccess =
          await getSignUpUseCase(GetSignUpParameters(request: event.request));

      failureOrSuccess.fold(
          (failure) => emit(APIFailureState(
              errorResponseModel: const ErrorResponseEntity(
                  responseCode: "Failed", responseError: "ApI Failed"))),
          (success) => emit(SignUpSuccessState(success)));
    });
    on<LoginEvent>((event, emit) async {
      emit(APILoadingState());
      final failureOrSuccess =
          await getLoginUseCase(GetLoginParameters(request: event.request));
      failureOrSuccess.fold(
          (failure) => emit(APIFailureState(
              errorResponseModel: const ErrorResponseEntity(
                  responseCode: "Failed", responseError: "ApI Failed"))),
          (success) => emit(LoginSuccessState(success)));
    });
    on<GetLoggedUserEvent>((event, emit) async {
      emit(APILoadingState());
      final failureOrSuccess = await getLoggedUserUseCase(NoParams());
      failureOrSuccess.fold(
          (failure) => emit(APIFailureState(
              errorResponseModel: const ErrorResponseEntity(
                  responseCode: "Failed", responseError: "ApI Failed"))),
          (success) => emit(GetLoggedUserSuccessState(success)));
    });
    on<GetLoggedOutEvent>((event, emit) async {
      emit(APILoadingState());
      final failureOrSuccess = await getLoggedOutUseCase(NoParams());
      failureOrSuccess.fold(
          (failure) => emit(APIFailureState(
              errorResponseModel: const ErrorResponseEntity(
                  responseCode: "Failed", responseError: "ApI Failed"))),
          (success) => emit(GetLoggedOutSuccessState(success)));
    });
  }
}
