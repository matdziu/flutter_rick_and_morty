import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/common/extensions/response_extensions.dart';
import 'package:rick_and_morty/data/network/dtos/characters/characters_response.dart';
import 'package:rick_and_morty/data/network/dtos/characters/characters_response_error.dart';
import 'package:rick_and_morty/domain/entities/exceptions/network_exception.dart';

class CharactersNetworkDataSource {
  Future<CharactersResponse> getCharacters({required int page}) async {
    final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'));
    final json = jsonDecode(response.body);
    if (response.isSuccessful()) {
      return CharactersResponse.fromJson(json);
    } else {
      throw NetworkException(
          statusCode: response.statusCode,
          message: CharactersResponseError.fromJson(json).error);
    }
  }
}
