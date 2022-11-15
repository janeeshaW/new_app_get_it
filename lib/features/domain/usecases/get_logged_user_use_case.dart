import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/domain/entities/response/login_response_entity.dart';
import 'package:news_app/features/domain/repository/repository.dart';




class GetLoggedUserUseCase extends UseCase<LoginResponseEntity, NoParams> {
  final Repository repository;

  GetLoggedUserUseCase(this.repository);

  @override
  Future<Either<Failure, LoginResponseEntity>> call(NoParams params) async {
    return await repository.getLoggedUser();
  }
}
