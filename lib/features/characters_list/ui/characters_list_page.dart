import 'package:flutter/material.dart';
import 'package:rick_and_morty/common/presentation/base_state.dart';
import 'package:rick_and_morty/features/characters_list/presentation/characters_list_presenter.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/batch_loading_state.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/full_loading_state.dart';
import 'package:rick_and_morty/features/characters_list/ui/characters_list_widget.dart';

class CharactersListPage extends StatelessWidget {
  final CharactersListPresenter _charactersListPresenter;

  const CharactersListPage(
      {Key? key, required CharactersListPresenter charactersListPresenter})
      : _charactersListPresenter = charactersListPresenter,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
      ),
      body: Stack(
        children: [
          CharactersListWidget(
              charactersListPresenter: _charactersListPresenter),
          StreamBuilder<BaseState>(
              stream: _charactersListPresenter.statesStream,
              initialData: _charactersListPresenter.initialState,
              builder: (context, snapshot) {
                return _handleCharactersListState(snapshot.data!);
              })
        ],
      ),
    );
  }

  Widget _handleCharactersListState(BaseState state) {
    if (state is FullLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is BatchLoadingState) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(),
            SizedBox(
              height: 16.0,
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
