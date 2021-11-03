import 'package:equatable/equatable.dart';

class CharactersResponseInfo with EquatableMixin {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  @override
  List<Object?> get props => [count, pages, next, prev];

  CharactersResponseInfo(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});

  CharactersResponseInfo.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        pages = json['pages'],
        next = json['next'],
        prev = json['prev'];
}
