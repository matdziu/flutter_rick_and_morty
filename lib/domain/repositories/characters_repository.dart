import 'package:rick_and_morty/domain/entities/characters/character.dart';

abstract class CharactersRepository {
  Future<List<Character>> getCharacters({required int page});
}
