import 'package:rick_and_morty/data/network/data_sources/characters_network_data_source.dart';
import 'package:rick_and_morty/domain/entities/characters/character.dart';
import 'package:rick_and_morty/domain/repositories/characters_repository.dart';

class DefaultCharactersRepository implements CharactersRepository {
  final CharactersNetworkDataSource _charactersNetworkDataSource;

  DefaultCharactersRepository(
      {required CharactersNetworkDataSource charactersNetworkDataSource})
      : _charactersNetworkDataSource = charactersNetworkDataSource;

  @override
  Future<List<Character>> getCharacters({required int page}) async {
    final response =
        await _charactersNetworkDataSource.getCharacters(page: page);
    return response.results
        .map((singleCharacterResponse) => singleCharacterResponse.toCharacter())
        .toList();
  }
}
