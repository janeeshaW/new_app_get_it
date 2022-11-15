import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/domain/entities/response/sign_up_response_entity.dart';
import 'package:news_app/features/domain/repository/repository.dart';




class GetLoggedOutUseCase extends UseCase<SignUpResponseEntity, NoParams> {
  final Repository repository;

  GetLoggedOutUseCase(this.repository);

  @override
  Future<Either<Failure, SignUpResponseEntity>> call(NoParams params) async {
    return await repository.getLoggedOut();
  }
}
