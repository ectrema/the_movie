import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movie/foundation/client/dio.client.dart';

@singleton
class TokenInterceptor {
  final DioClient _dioClient;

  TokenInterceptor({
    required DioClient dioClient,
  }) : _dioClient = dioClient {
    _init();
  }

  void _init() {
    const String header = String.fromEnvironment('HEADER_TOKEN');
    _dioClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers.addAll(
            <String, dynamic>{'Authorization': 'Bearer $header'},
          );
          handler.next(options);
        },
      ),
    );
  }
}
