import 'package:grocery_app/data/models/api_response.dart';
import 'package:grocery_app/data/models/banner_model.dart';

abstract class BannerRepo {
  Future<ApiResponse<BannerModel>> getBanners();

  Future<ApiResponse<BannerModel>> getBannerById(int id);

  Future<ApiResponse<void>> createBanner(BannerModel banner);

  Future<ApiResponse<void>> updateBanner(int id, BannerModel banner);

  Future<ApiResponse<void>> deleteBanner(int id);
}
