import 'package:grocery_app/data/api/dio_client.dart';

class ProductRepo {
  final DioClient dioClient;

  ProductRepo({required this.dioClient});

  Future<dynamic> getProducts()async{
    final response = await dioClient.get("/products");
    return response.data;
  }
}