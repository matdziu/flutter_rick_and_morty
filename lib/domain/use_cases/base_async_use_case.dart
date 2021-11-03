import 'package:rick_and_morty/domain/entities/common/result.dart';

abstract class BaseAsyncUseCase<I extends UseCaseInput,
    O extends UseCaseOutput> {
  Future<Result<O>> execute(I input);
}

abstract class UseCaseInput {}

class NoneInput extends UseCaseInput {}

abstract class UseCaseOutput {}

class NoneOutput extends UseCaseOutput {}
