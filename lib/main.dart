import 'package:flutter/material.dart';
import 'package:rick_and_morty/common/dependencies/dependencies_container.dart';
import 'package:rick_and_morty/features/characters_list/dependencies/characters_list_dependencies.dart';
import 'package:rick_and_morty/features/characters_list/ui/characters_list_page.dart';

void main() {
  runApp(MaterialApp(
    home: _createCharactersListPage(),
  ));
}

CharactersListPage _createCharactersListPage() {
  initCharactersListDependencies();
  return CharactersListPage(
      charactersListPresenter: dependenciesContainer.get());
}
