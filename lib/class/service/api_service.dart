import 'package:book_app/constant/const.dart';
import 'package:dio/dio.dart';

class ApiServic {
  static final _baseOptions = BaseOptions(
    baseUrl: Const.baseUrl,
    contentType: "application/json",
    connectTimeout: 50000,
    receiveTimeout: 50000,
  );

  static Dio client = Dio(_baseOptions)
    ..interceptors.add(
      LogInterceptor(
        requestHeader: true,
        error: true,
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
}
