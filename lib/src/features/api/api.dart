import 'package:bilim_all/src/features/shared_pref/shared_pref.dart';
import 'package:dio/dio.dart';

class Api {
  late final dio = Dio(options)..interceptors.addAll([_BasicInterceptor()]);
  final options = BaseOptions(
      baseUrl: 'https://rocky-fortress-84759.herokuapp.com/api/',
  );
}

class _BasicInterceptor implements Interceptor {

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {
    var token  = await SharedPrefModel().getToken();
    options.headers = {
      "Accept": "application/json",
      "Authorization" :"Bearer $token"
    };

    handler.next(options);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}