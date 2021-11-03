import 'dart:convert';

import 'package:http/http.dart';

extension ResponseExtensions on Response {
  bool isSuccessful() {
    return statusCode >= 200 && statusCode < 400;
  }
}
