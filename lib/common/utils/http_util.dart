import 'package:dio/dio.dart';
import 'package:u_course_example/common/values/constant.dart';
import 'package:u_course_example/global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'application/json',
      responseType: ResponseType.json,
    );

    dio = Dio(options);
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Options requestOptions = options ?? Options();

    requestOptions.headers = requestOptions.headers ?? {};

    final auth = getAuthorizationHeader();

    if (auth != null) {
      requestOptions.headers!.addAll(auth);
    }

    final response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response.data;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    final headers = <String, dynamic>{};

    final accessToken = Global.storageService.getUserToken();

    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }
}
