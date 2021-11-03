import 'package:rick_and_morty/common/presentation/base_state.dart';
import 'package:rick_and_morty/domain/entities/characters/character.dart';

class CharactersBatchState extends BaseState {
  final List<Character> batch;

  CharactersBatchState({required this.batch});

  @override
  List<Object> get props => [batch];
}
