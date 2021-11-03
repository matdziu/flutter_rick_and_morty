import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/domain/entities/characters/character.dart';

class SingleCharacterResponse with EquatableMixin {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;

  @override
  List<Object> get props => [id, name, status, species, image];

  SingleCharacterResponse(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.image});

  SingleCharacterResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        species = json['species'],
        image = json['image'];

  Character toCharacter() {
    return Character(
        id: id.toString(),
        name: name,
        status: status,
        species: species,
        image: image);
  }
}
