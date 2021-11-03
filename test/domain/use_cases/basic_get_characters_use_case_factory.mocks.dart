// Mocks generated by Mockito 5.0.16 from annotations
// in rick_and_morty/test/domain/use_cases/basic_get_characters_use_case_factory.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rick_and_morty/data/repositories/default_characters_repository.dart'
    as _i2;
import 'package:rick_and_morty/domain/entities/characters/character.dart'
    as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [DefaultCharactersRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDefaultCharactersRepository extends _i1.Mock
    implements _i2.DefaultCharactersRepository {
  MockDefaultCharactersRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Character>> getCharacters({int? page}) =>
      (super.noSuchMethod(Invocation.method(#getCharacters, [], {#page: page}),
              returnValue: Future<List<_i4.Character>>.value(<_i4.Character>[]))
          as _i3.Future<List<_i4.Character>>);
  @override
  String toString() => super.toString();
}