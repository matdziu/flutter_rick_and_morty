// Mocks generated by Mockito 5.0.16 from annotations
// in rick_and_morty/test/data/repositories/basic_default_characters_repository_factory.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rick_and_morty/data/network/data_sources/characters_network_data_source.dart'
    as _i3;
import 'package:rick_and_morty/data/network/dtos/characters/characters_response.dart'
    as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeCharactersResponse_0 extends _i1.Fake
    implements _i2.CharactersResponse {}

/// A class which mocks [CharactersNetworkDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharactersNetworkDataSource extends _i1.Mock
    implements _i3.CharactersNetworkDataSource {
  MockCharactersNetworkDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CharactersResponse> getCharacters({int? page}) =>
      (super.noSuchMethod(Invocation.method(#getCharacters, [], {#page: page}),
              returnValue: Future<_i2.CharactersResponse>.value(
                  _FakeCharactersResponse_0()))
          as _i4.Future<_i2.CharactersResponse>);
  @override
  String toString() => super.toString();
}