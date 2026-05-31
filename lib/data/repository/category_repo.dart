import 'package:grocery_app/core/utils/app_constants.dart';
import 'package:grocery_app/data/api/dio_client.dart';

class CategoryRepo {
  final DioClient dioClient;

  CategoryRepo({required this.dioClient});

  Future<dynamic> getCategories() async {
    final response = await dioClient.get(AppConstants.getCategoriesUri);
    return response.data;
  }
}
