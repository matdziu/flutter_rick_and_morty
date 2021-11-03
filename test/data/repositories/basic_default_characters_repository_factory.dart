import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty/data/network/data_sources/characters_network_data_source.dart';
import 'package:rick_and_morty/data/repositories/default_characters_repository.dart';

import '../../common_test/base_test_factory.dart';
import '../network/dtos/characters/basic_characters_response_factory.dart';
import 'basic_default_characters_repository_factory.mocks.dart';

@GenerateMocks([CharactersNetworkDataSource])
class BasicDefaultCharactersRepositoryFactory
    extends BaseTestFactory<DefaultCharactersRepository> {
  final charactersNetworkDataSource = MockCharactersNetworkDataSource();

  BasicDefaultCharactersRepositoryFactory() {
    mockCharactersNetworkDataSource();
  }

  void mockCharactersNetworkDataSource() {
    when(charactersNetworkDataSource.getCharacters(page: anyNamed('page')))
        .thenAnswer((_) async => BasicCharactersResponseFactory().create());
  }

  @override
  DefaultCharactersRepository create() {
    return DefaultCharactersRepository(
        charactersNetworkDataSource: charactersNetworkDataSource);
  }
}
