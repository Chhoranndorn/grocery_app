import 'package:dio/dio.dart';
import 'package:grocery_app/core/utils/app_constants.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl, // fake base URL
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<Response> post(String path, Map data) async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network

    // MOCK ROUTING LOGIC
    if (path == "/login") {
      if (data["email"] == "admin@gmail.com" && data["password"] == "123456") {
        return Response(
          requestOptions: RequestOptions(path: path),
          statusCode: 200,
          data: {
            "message": "Login success",
            "user": {"name": "Admin", "email": data["email"]},
          },
        );
      } else {
        return Response(
          requestOptions: RequestOptions(path: path),
          statusCode: 400,
          data: {"message": "Invalid email or password"},
        );
      }
    }

    if (path == "/send-otp") {
      return Response(
        requestOptions: RequestOptions(path: path),
        statusCode: 200,
        data: {"message": "OTP sent successfully", "otp": "1234"},
      );
    }

    return Response(
      requestOptions: RequestOptions(path: path),
      statusCode: 404,
      data: {"message": "Not found"},
    );
  }
}
