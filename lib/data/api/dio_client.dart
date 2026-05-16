import 'package:dio/dio.dart';
import 'package:grocery_app/core/utils/app_constants.dart';

class DioClient {

  final Dio dio;
  DioClient()
      : dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      }
    ),
  );

  Future<Response> get(String path)async{
    try{
      final response = await dio.get(path);
      return response;
    }catch(e){
      throw Exception("GET error: $e");
    }
  }

  Future<Response> post(String path, Map data) async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network
try{
  final response = await dio.post(path, data: data);
  return response;

}catch(e){
  throw Exception("POST error: $e");
}
  }
}
