import 'package:grocery_app/core/utils/app_constants.dart';
import 'package:grocery_app/data/api/dio_client.dart';

class ProductRepo {
  final DioClient dioClient;

  ProductRepo({required this.dioClient});

  Future<dynamic> getProducts() async {
    final response = await dioClient.get(AppConstants.getProductsUri);
    return response.data;
  }

  Future<dynamic> getExclusiveOffers() async {
    final response = await dioClient.get(AppConstants.getExclusiveOffersUri);
    return response.data;
  }

  Future<dynamic> getBestSelling() async {
    final response = await dioClient.get(AppConstants.getBestSellingUri);
    return response.data;
  }
}
