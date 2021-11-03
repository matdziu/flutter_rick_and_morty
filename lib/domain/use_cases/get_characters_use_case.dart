import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/domain/entities/characters/character.dart';
import 'package:rick_and_morty/domain/entities/common/result.dart';
import 'package:rick_and_morty/domain/entities/exceptions/network_exception.dart';
import 'package:rick_and_morty/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty/domain/use_cases/base_async_use_case.dart';

class GetCharactersUseCase
    extends BaseAsyncUseCase<GetCharactersInput, GetCharactersOutput> {
  final CharactersRepository _charactersRepository;

  GetCharactersUseCase({required CharactersRepository charactersRepository})
      : _charactersRepository = charactersRepository;

  @override
  Future<Result<GetCharactersOutput>> execute(GetCharactersInput input) async {
    try {
      final characters =
          await _charactersRepository.getCharacters(page: input.page);
      final output = GetCharactersOutput(characters: characters);
      return Result.success(output);
    } on NetworkException catch (networkException) {
      if (networkException.statusCode == 404) {
        // this means that there are no more pages available
        return Result.success(GetCharactersOutput(characters: []));
      } else {
        return Result.failure(networkException);
      }
    } on Exception catch (exception) {
      return Result.failure(exception);
    }
  }
}

class GetCharactersInput extends UseCaseInput with EquatableMixin {
  final int page;

  @override
  List<Object> get props => [page];

  GetCharactersInput({required this.page});
}

class GetCharactersOutput extends UseCaseOutput with EquatableMixin {
  final List<Character> characters;

  @override
  List<Object> get props => [characters];

  GetCharactersOutput({required this.characters});
}
