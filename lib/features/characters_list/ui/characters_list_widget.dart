import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/characters/character.dart';
import 'package:rick_and_morty/features/characters_list/presentation/characters_list_presenter.dart';
import 'package:rick_and_morty/features/characters_list/presentation/events/batch_fetch_event.dart';
import 'package:rick_and_morty/features/characters_list/presentation/events/initial_fetch_event.dart';
import 'package:rick_and_morty/features/characters_list/presentation/states/characters_batch_state.dart';
import 'package:rick_and_morty/features/characters_list/ui/character_list_tile_widget.dart';

class CharactersListWidget extends StatefulWidget {
  final CharactersListPresenter _charactersListPresenter;

  const CharactersListWidget(
      {Key? key, required CharactersListPresenter charactersListPresenter})
      : _charactersListPresenter = charactersListPresenter,
        super(key: key);

  @override
  State<CharactersListWidget> createState() => _CharactersListWidgetState();
}

class _CharactersListWidgetState extends State<CharactersListWidget> {
  final ScrollController _scrollController = ScrollController();
  final List<Character> _fullCharactersList = [];

  @override
  void initState() {
    super.initState();
    widget._charactersListPresenter.statesStream.listen((state) {
      if (state is CharactersBatchState) {
        setState(() {
          _fullCharactersList.addAll(state.batch);
        });
      }
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      widget._charactersListPresenter.pushEvent(InitialFetchEvent());
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        widget._charactersListPresenter.pushEvent(BatchFetchEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _fullCharactersList.length,
        itemBuilder: (context, index) {
          final character = _fullCharactersList[index];
          return CharacterListTileWidget(
            imageUrl: character.image,
            name: character.name,
          );
        });
  }

  @override
  void dispose() {
    widget._charactersListPresenter.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
