import 'package:rick_and_morty/domain/entities/characters/character.dart';

import '../../../common_test/base_test_factory.dart';
import '../../../data/network/dtos/characters/basic_single_character_response_factory.dart';

class BasicCharacterFactory extends BaseTestFactory<Character> {
  @override
  Character create() {
    return Character(
      id: BasicSingleCharacterResponseFactory.id.toString(),
      name: BasicSingleCharacterResponseFactory.name,
      status: BasicSingleCharacterResponseFactory.status,
      species: BasicSingleCharacterResponseFactory.species,
      image: BasicSingleCharacterResponseFactory.image,
    );
  }
}
