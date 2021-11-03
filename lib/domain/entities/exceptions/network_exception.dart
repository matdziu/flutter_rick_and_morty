import 'package:equatable/equatable.dart';

class NetworkException with EquatableMixin implements Exception {
  final int statusCode;
  final String message;

  @override
  List<Object> get props => [statusCode, message];

  NetworkException({required this.statusCode, required this.message});
}
