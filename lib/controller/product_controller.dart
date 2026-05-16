import 'package:get/get.dart';
import 'package:grocery_app/data/models/product_model.dart';
import 'package:grocery_app/data/repository/product_repo.dart';

class ProductController extends GetxController {

  final ProductRepo productRepo;

  ProductController({required this.productRepo});
  var productList = [].obs;
  var isLoading = true.obs;


  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }


  void fetchProducts()async{
    try{
      isLoading(true);
      final response = await productRepo.getProducts();
      final res = ProductResponse.fromJson(response);
      productList.value = res.products;
    } finally{
      isLoading(false);
    }
  }

}