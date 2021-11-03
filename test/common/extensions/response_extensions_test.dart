import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:rick_and_morty/common/extensions/response_extensions.dart';

void main() {
  test('should return false when status code is 500', () {
    final response = Response('', 500);
    expect(response.isSuccessful(), false);
  });

  test('should return false when status code is 404', () {
    final response = Response('', 404);
    expect(response.isSuccessful(), false);
  });

  test('should return true when status code is 200', () {
    final response = Response('', 200);
    expect(response.isSuccessful(), true);
  });

  test('should return true when status code is 201', () {
    final response = Response('', 201);
    expect(response.isSuccessful(), true);
  });

  test('should return true when status code is 300', () {
    final response = Response('', 300);
    expect(response.isSuccessful(), true);
  });
}
