import 'package:rick_and_morty/data/network/dtos/characters/single_character_response.dart';

import '../../../../common_test/base_test_factory.dart';

class BasicSingleCharacterResponseFactory
    extends BaseTestFactory<SingleCharacterResponse> {
  static const id = 1;
  static const name = 'testCharacterName';
  static const status = 'testCharacterStatus';
  static const species = 'testCharacterSpecies';
  static const image = 'testCharacterImage';

  @override
  SingleCharacterResponse create() {
    return SingleCharacterResponse(
      id: id,
      name: name,
      status: status,
      species: species,
      image: image,
    );
  }
}
