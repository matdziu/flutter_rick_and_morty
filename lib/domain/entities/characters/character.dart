import 'package:equatable/equatable.dart';

class Character with EquatableMixin {
  final String id;
  final String name;
  final String status;
  final String species;
  final String image;

  @override
  List<Object> get props => [id, name, status, species, image];

  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.image});
}
