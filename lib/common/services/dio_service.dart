import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio();

  Future<dynamic> postMethod(FormData formData, String url) async {
    _dio.options.headers["content-type"] = "application/json";

    return await _dio
        .post(url,
            data: formData,
            options: Options(
              responseType: ResponseType.json,
              method: "POST",
            ))
        .then((value) {
      return value;
    });
  }
}
