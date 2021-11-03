import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../domain/entities/characters/basic_character_factory.dart';
import 'basic_default_characters_repository_factory.dart';

void main() {
  test('should return a list of characters from network data source', () async {
    final testFactory = BasicDefaultCharactersRepositoryFactory();
    final defaultCharactersRepository = testFactory.create();

    final output = await defaultCharactersRepository.getCharacters(page: 1);
    expect(output, [
      BasicCharacterFactory().create(),
      BasicCharacterFactory().create(),
      BasicCharacterFactory().create(),
    ]);
    verify(testFactory.charactersNetworkDataSource.getCharacters(page: 1));
  });
}
