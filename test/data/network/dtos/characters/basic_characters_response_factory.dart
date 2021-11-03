import 'package:rick_and_morty/data/network/dtos/characters/characters_response.dart';

import '../../../../common_test/base_test_factory.dart';
import 'basic_characters_response_info_factory.dart';
import 'basic_single_character_response_factory.dart';

class BasicCharactersResponseFactory
    extends BaseTestFactory<CharactersResponse> {
  @override
  CharactersResponse create() {
    return CharactersResponse(
        info: BasicCharactersResponseInfoFactory().create(),
        results: [
          BasicSingleCharacterResponseFactory().create(),
          BasicSingleCharacterResponseFactory().create(),
          BasicSingleCharacterResponseFactory().create(),
        ]);
  }
}
