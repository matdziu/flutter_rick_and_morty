import 'package:rick_and_morty/common/presentation/base_event.dart';
import 'package:rick_and_morty/common/presentation/base_presenter.dart';
import 'package:rick_and_morty/common/presentation/base_state.dart';
import 'package:rick_and_morty/domain/entities/common/result.dart';
import 'package:rick_and_morty/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/batch_loading_state.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/characters_batch_state.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/error_state.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/full_loading_state.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/initial_state.dart';

import 'events/batch_fetch_event.dart';
import 'events/initial_fetch_event.dart';

class CharactersListPresenter extends BasePresenter {
  final GetCharactersUseCase _getCharactersUseCase;
  int _pageToBeFetched = 1;
  bool _noMorePagesToLoad = false;
  bool _batchFetchingInProgress = false;

  CharactersListPresenter({required GetCharactersUseCase getCharactersUseCase})
      : _getCharactersUseCase = getCharactersUseCase,
        super(initialState: InitialState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is InitialFetchEvent) {
      yield* _mapInitialFetchEventToState();
    } else if (event is BatchFetchEvent) {
      yield* _mapBatchFetchEventToState();
    }
  }

  Stream<BaseState> _mapInitialFetchEventToState() async* {
    yield FullLoadingState();
    _pageToBeFetched = 1;
    _noMorePagesToLoad = false;
    yield* _emitStateForCharactersFetch();
  }

  Stream<BaseState> _mapBatchFetchEventToState() async* {
    if (!_noMorePagesToLoad && !_batchFetchingInProgress) {
      yield BatchLoadingState();
      yield* _emitStateForCharactersFetch();
    }
  }

  Stream<BaseState> _emitStateForCharactersFetch() async* {
    _batchFetchingInProgress = true;
    final charactersBatchResult = await _getCharactersUseCase
        .execute(GetCharactersInput(page: _pageToBeFetched));
    if (charactersBatchResult is ResultSuccess) {
      final batch =
          (charactersBatchResult.toSuccess().data as GetCharactersOutput)
              .characters;
      _pageToBeFetched += 1;
      _noMorePagesToLoad = batch.isEmpty;
      _batchFetchingInProgress = false;
      yield CharactersBatchState(batch: batch);
    } else if (charactersBatchResult is ResultFailure) {
      _batchFetchingInProgress = false;
      yield ErrorState();
    }
  }
}
