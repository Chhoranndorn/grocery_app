import 'package:get/get.dart';
import 'package:grocery_app/data/models/category_model.dart';
import 'package:grocery_app/data/repository/category_repo.dart';

class CategoryController extends GetxController {
  final CategoryRepo categoryRepo;

  CategoryController({required this.categoryRepo});

  var allCategories = <Category>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      errorMessage('');

      final response = await categoryRepo.getCategories();

      final res = CategoryResponse.fromJson(response);

      allCategories.value = res.categories;
    } catch (e) {
      errorMessage('Failed to load categories');
      print('Category error: $e');
    } finally {
      isLoading(false);
    }
  }
}
