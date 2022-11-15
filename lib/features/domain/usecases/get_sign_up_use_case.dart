import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/domain/entities/request/sign_up_request_entity.dart';
import 'package:news_app/features/domain/entities/response/sign_up_response_entity.dart';
import 'package:news_app/features/domain/repository/repository.dart';



class GetSignUpUseCase
    extends UseCase<SignUpResponseEntity, GetSignUpParameters> {
  final Repository repository;

  GetSignUpUseCase(this.repository);

  @override
  Future<Either<Failure, SignUpResponseEntity>> call(
      GetSignUpParameters params) async {
    return await repository.getSignUp(params.request);
  }
}

class GetSignUpParameters extends Equatable {
  final SignUpRequestEntity request;

  const GetSignUpParameters({required this.request});

  @override
  List<Object> get props => [request];
}
