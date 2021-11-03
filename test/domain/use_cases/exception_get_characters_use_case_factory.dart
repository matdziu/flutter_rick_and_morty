import 'package:mockito/mockito.dart';
import 'package:rick_and_morty/domain/entities/exceptions/network_exception.dart';

import 'basic_get_characters_use_case_factory.dart';

class ExceptionGetCharactersUseCaseFactory
    extends BasicGetCharactersUseCaseFactory {
  final NetworkException networkException;

  ExceptionGetCharactersUseCaseFactory({required this.networkException});

  @override
  void mockDefaultCharactersRepository() {
    when(defaultCharactersRepository.getCharacters(page: anyNamed('page')))
        .thenThrow(networkException);
  }
}
