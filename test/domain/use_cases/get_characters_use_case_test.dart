import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty/domain/entities/common/result.dart';
import 'package:rick_and_morty/domain/entities/exceptions/network_exception.dart';
import 'package:rick_and_morty/domain/use_cases/get_characters_use_case.dart';

import '../entities/characters/basic_character_factory.dart';
import 'basic_get_characters_use_case_factory.dart';
import 'exception_get_characters_use_case_factory.dart';

void main() {
  test('should return a list of characters when executing use case', () async {
    final testFactory = BasicGetCharactersUseCaseFactory();
    final getCharactersUseCase = testFactory.create();

    final output =
        await getCharactersUseCase.execute(GetCharactersInput(page: 1));

    expect(
        output,
        Result.success(GetCharactersOutput(characters: [
          BasicCharacterFactory().create(),
          BasicCharacterFactory().create(),
          BasicCharacterFactory().create()
        ])));
    verify(testFactory.defaultCharactersRepository.getCharacters(page: 1));
  });

  test(
      'should return empty list when there is network exception with 404 status code',
      () async {
    final testFactory = ExceptionGetCharactersUseCaseFactory(
      networkException: NetworkException(statusCode: 404, message: ''),
    );
    final getCharactersUseCase = testFactory.create();

    final output =
        await getCharactersUseCase.execute(GetCharactersInput(page: 1));

    expect(output, Result.success(GetCharactersOutput(characters: [])));
    verify(testFactory.defaultCharactersRepository.getCharacters(page: 1));
  });
}
