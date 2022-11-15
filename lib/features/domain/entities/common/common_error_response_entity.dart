import 'package:equatable/equatable.dart';



class ErrorResponseEntity extends Equatable {
  const ErrorResponseEntity({
    this.responseCode,
    this.responseError,
  });

  final String? responseCode;
  final String? responseError;

  @override
  List<Object> get props => [responseError!, responseCode!];
}
