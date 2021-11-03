import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/data/network/dtos/characters/characters_response_info.dart';
import 'package:rick_and_morty/data/network/dtos/characters/single_character_response.dart';

class CharactersResponse with EquatableMixin {
  final CharactersResponseInfo info;
  final List<SingleCharacterResponse> results;

  @override
  List<Object> get props => [info, results];

  CharactersResponse({required this.info, required this.results});

  CharactersResponse.fromJson(Map<String, dynamic> json)
      : info = CharactersResponseInfo.fromJson(json['info']),
        results = (json['results'] as List)
            .map((jsonObject) => SingleCharacterResponse.fromJson(jsonObject))
            .toList();
}
