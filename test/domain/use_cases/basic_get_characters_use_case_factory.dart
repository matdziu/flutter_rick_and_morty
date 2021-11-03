import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty/data/repositories/default_characters_repository.dart';
import 'package:rick_and_morty/domain/use_cases/get_characters_use_case.dart';

import '../../common_test/base_test_factory.dart';
import '../entities/characters/basic_character_factory.dart';
import 'basic_get_characters_use_case_factory.mocks.dart';

@GenerateMocks([DefaultCharactersRepository])
class BasicGetCharactersUseCaseFactory
    extends BaseTestFactory<GetCharactersUseCase> {
  final MockDefaultCharactersRepository defaultCharactersRepository =
      MockDefaultCharactersRepository();

  BasicGetCharactersUseCaseFactory() {
    mockDefaultCharactersRepository();
  }

  void mockDefaultCharactersRepository() {
    when(defaultCharactersRepository.getCharacters(page: anyNamed('page')))
        .thenAnswer((_) async => [
              BasicCharacterFactory().create(),
              BasicCharacterFactory().create(),
              BasicCharacterFactory().create(),
            ]);
  }

  @override
  GetCharactersUseCase create() {
    return GetCharactersUseCase(
        charactersRepository: defaultCharactersRepository);
  }
}
