import 'package:equatable/equatable.dart';

abstract class Result<T> with EquatableMixin {
  Result();

  factory Result.success(T data) => ResultSuccess(data);

  factory Result.failure(Exception exception) => ResultFailure(exception);

  ResultSuccess toSuccess() {
    return this as ResultSuccess;
  }

  ResultFailure toFailure() {
    return this as ResultFailure;
  }
}

class ResultSuccess<T> extends Result<T> {
  final T data;

  @override
  List<T> get props => [data];

  ResultSuccess(this.data);
}

class ResultFailure<T> extends Result<T> {
  final Exception exception;

  @override
  List<Object> get props => [exception];

  ResultFailure(this.exception);
}
