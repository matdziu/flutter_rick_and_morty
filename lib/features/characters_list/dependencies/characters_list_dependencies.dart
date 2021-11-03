import 'package:rick_and_morty/common/dependencies/dependencies_container.dart';
import 'package:rick_and_morty/data/network/data_sources/characters_network_data_source.dart';
import 'package:rick_and_morty/data/repositories/default_characters_repository.dart';
import 'package:rick_and_morty/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty/features/characters_list/presentation/characters_list_presenter.dart';

void initCharactersListDependencies() {
  dependenciesContainer.registerFactory(() => CharactersListPresenter(
      getCharactersUseCase: dependenciesContainer.get()));

  dependenciesContainer.registerFactory(() =>
      GetCharactersUseCase(charactersRepository: dependenciesContainer.get()));

  dependenciesContainer.registerFactory<CharactersRepository>(() =>
      DefaultCharactersRepository(
          charactersNetworkDataSource: dependenciesContainer.get()));

  dependenciesContainer.registerFactory(() => CharactersNetworkDataSource());
}
