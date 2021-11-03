import 'package:equatable/equatable.dart';

class CharactersResponseError with EquatableMixin {
  final String error;

  @override
  List<Object> get props => [error];

  CharactersResponseError({required this.error});

  CharactersResponseError.fromJson(Map<String, dynamic> json)
      : error = json['error'];
}
