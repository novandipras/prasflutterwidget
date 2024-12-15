import 'dart:convert';
import 'dart:developer';

import 'package:dio/io.dart';

import '../../core.dart';

class CustomDio with DioMixin implements Dio {
  CustomDio._() {
    options = BaseOptions(
      contentType: 'application/json; charset=utf-8',
      connectTimeout: const Duration(
        seconds: 60,
      ),
      receiveTimeout: const Duration(
        seconds: 60,
      ),
    );

    interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        requestBody: true,
        logPrint: (object) {
          try {
            final dynamic json = jsonDecode(object.toString());
            final String prettyJson =
                const JsonEncoder.withIndent('  ').convert(json);
            log(prettyJson);
          } catch (e) {
            log(object.toString());
          }
        },
      ),
    );

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          LocalSharedPreferences lsp = injection<LocalSharedPreferences>();
          lsp.getCookies().then((value) async {
            if (value != null && value.isNotEmpty) {
              options.headers.addAll({'Cookie': value.last});
            }
          });
          handler.next(options);
        },
        onResponse: (response, handler) async {
          LocalSharedPreferences lsp = injection<LocalSharedPreferences>();
          final setCookie = response.headers.map['set-cookie'];
          if (setCookie != null) {
            await lsp.saveCookies(setCookie);
          }
          handler.next(response);
        },
        onError: (error, handler) async {
          handler.next(error);
          handler.reject(error);
        },
      ),
    );

    httpClientAdapter = IOHttpClientAdapter();
  }

  static final CustomDio _instance = CustomDio._();

  static CustomDio get instance => _instance;
}
