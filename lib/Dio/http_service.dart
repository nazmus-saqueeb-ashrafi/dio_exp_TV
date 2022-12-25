import 'package:dio/dio.dart';

class DioClient {
  Dio dio;

  // or new Dio with a BaseOptions instance.
  DioClient() {
    var options = BaseOptions(
      baseUrl: 'https://travelverse-mobile-server.onrender.com',
      connectTimeout: 80000,
      receiveTimeout: 80000, // 80 sec
    );
    dio = Dio(options);

    initializeInterceptors();
  }


  //


  // GET REQUEST
  Future<Response> get(String endpoint) async {
    Response response;

    try {
      response = await dio.get(endpoint);
      print(response);

      return response;
    } catch (e) {
      print(e);
    }
  }


  //

  initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          print("${options.method} ${options.path}");
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onResponse: (response, handler) {
          // Do something with response data
          print(response.data);
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onError: (DioError e, handler) {
          // Do something with response error
          print(e.message);
          return handler.next(e); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
        },
      ),
    );
  }
}
