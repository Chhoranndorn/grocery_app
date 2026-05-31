import 'package:get/get.dart';
import 'package:grocery_app/data/models/product_model.dart';
import 'package:grocery_app/data/repository/product_repo.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;

  ProductController({required this.productRepo});
  var allProducts = <Product>[].obs;
  var exclusiveOffers = <Product>[].obs;
  var bestSelling = <Product>[].obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchAll();
    super.onInit();
  }

  void fetchAll() async {
    await fetchProducts();
    await fetchExclusiveOffers();
    await fetchBestSelling();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await productRepo.getProducts();
      final res = ProductResponse.fromJson(response);
      allProducts.value = res.products;
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchExclusiveOffers() async {
    try {
      isLoading(true);
      final response = await productRepo.getExclusiveOffers();
      final res = ProductResponse.fromJson(response);
      exclusiveOffers.value = res.products;
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchBestSelling() async {
    try {
      isLoading(true);
      final response = await productRepo.getBestSelling();
      final res = ProductResponse.fromJson(response);
      bestSelling.value = res.products;
    } finally {
      isLoading(false);
    }
  }
}
