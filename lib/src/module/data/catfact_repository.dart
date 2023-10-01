import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:sample_application/src/api/api.dart';
import 'package:sample_application/src/module/data/api_exception.dart';
import 'package:sample_application/src/module/domain/catfact/catfact.dart';

/// Repository using the http client. Calls API methods and parses responses.
class HttpCatFactRepository {
  HttpCatFactRepository({required this.api});

  final APIs api;

  HttpWithMiddleware http = HttpWithMiddleware.build(
      requestTimeout: const Duration(seconds: 30),
      middlewares: [
        HttpLogger(logLevel: LogLevel.BODY),
      ]);

  Future<CatFact> getCatFact() => _getData(
        uri: api.catFact(),
        builder: (data) => CatFact.fromJson(data),
      );

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await http.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw InvalidApiKeyException();
        case 404:
          throw CityNotFoundException();
        default:
          throw UnknownException();
      }
    } on SocketException catch (_) {
      throw NoInternetConnectionException();
    }
  }
}

/// Providers used by rest of the app
final catFactRepositoryProvider = Provider<HttpCatFactRepository>((ref) {
  return HttpCatFactRepository(api: APIs());
});
