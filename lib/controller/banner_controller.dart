import 'package:get/get.dart';
import 'package:grocery_app/core/enums/status_enum.dart';
import 'package:grocery_app/data/models/banner_model.dart';
import 'package:grocery_app/data/repository/banner_repo.dart';

class BannerController extends GetxController {
  final BannerRepo bannerRepo;

  BannerController({required this.bannerRepo});

  final RxList<BannerItem> banners = <BannerItem>[].obs;

  final Rx<Status> status = Status.loading.obs;

  final RxString message = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getBanners();
  }

  Future<void> getBanners() async {
    try {
      status.value = Status.loading;

      final response = await bannerRepo.getBanners();

      status.value = response.status;
      message.value = response.message;

      if (response.status == Status.success && response.data != null) {
        banners.assignAll(response.data!.data ?? []);
      } else {
        banners.clear();
      }
    } catch (e) {
      status.value = Status.error;
      message.value = e.toString();
      banners.clear();
    }
  }
}
