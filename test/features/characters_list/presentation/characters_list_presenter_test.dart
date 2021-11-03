import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty/features/characters_list/presentation/events/batch_fetch_event.dart';
import 'package:rick_and_morty/features/characters_list/presentation/events/initial_fetch_event.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/batch_loading_state.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/characters_batch_state.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/full_loading_state.dart';

import '../../../domain/entities/characters/basic_character_factory.dart';
import 'basic_characters_list_presenter_factory.dart';

void main() {
  test('should return characters batch state given initial fetch event',
      () async {
    final testFactory = BasicCharactersListPresenterFactory(characters: [
      BasicCharacterFactory().create(),
      BasicCharacterFactory().create(),
      BasicCharacterFactory().create(),
    ]);
    final charactersListPresenter = testFactory.create();

    expect(
        charactersListPresenter.statesStream,
        emitsInOrder([
          FullLoadingState(),
          CharactersBatchState(batch: testFactory.characters),
        ]));
    charactersListPresenter.pushEvent(InitialFetchEvent());
  });

  test('should return characters batch state given batch fetch event',
      () async {
    final testFactory = BasicCharactersListPresenterFactory(characters: [
      BasicCharacterFactory().create(),
      BasicCharacterFactory().create(),
      BasicCharacterFactory().create(),
    ]);
    final charactersListPresenter = testFactory.create();

    expect(
        charactersListPresenter.statesStream,
        emitsInOrder([
          BatchLoadingState(),
          CharactersBatchState(batch: testFactory.characters),
        ]));
    charactersListPresenter.pushEvent(BatchFetchEvent());
  });

  test('should not execute use case when there are no more items to load',
      () async {
    final testFactory = BasicCharactersListPresenterFactory(characters: []);
    final charactersListPresenter = testFactory.create();

    charactersListPresenter.pushEvent(BatchFetchEvent());
    charactersListPresenter.pushEvent(BatchFetchEvent());
    charactersListPresenter.pushEvent(BatchFetchEvent());

    verifyNever(testFactory.getCharactersUseCase.execute(any));
  });
}
