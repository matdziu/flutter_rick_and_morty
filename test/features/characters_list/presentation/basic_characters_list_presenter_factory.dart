import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty/domain/entities/characters/character.dart';
import 'package:rick_and_morty/domain/entities/common/result.dart';
import 'package:rick_and_morty/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty/features/characters_list/presentation/characters_list_presenter.dart';

import '../../../common_test/base_test_factory.dart';
import 'basic_characters_list_presenter_factory.mocks.dart';

@GenerateMocks([GetCharactersUseCase])
class BasicCharactersListPresenterFactory
    extends BaseTestFactory<CharactersListPresenter> {
  final MockGetCharactersUseCase getCharactersUseCase =
      MockGetCharactersUseCase();

  final List<Character> characters;

  BasicCharactersListPresenterFactory({required this.characters}) {
    mockGetCharactersUseCase(characters);
  }

  void mockGetCharactersUseCase(List<Character> characters) {
    when(getCharactersUseCase.execute(any)).thenAnswer((_) async =>
        Result.success(GetCharactersOutput(characters: characters)));
  }

  @override
  CharactersListPresenter create() {
    return CharactersListPresenter(getCharactersUseCase: getCharactersUseCase);
  }
}
