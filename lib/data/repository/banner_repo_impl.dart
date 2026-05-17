import 'package:grocery_app/data/api/dio_client.dart';
import 'package:grocery_app/data/models/api_response.dart';
import 'package:grocery_app/data/models/banner_model.dart';
import 'package:grocery_app/data/repository/banner_repo.dart';
import 'package:grocery_app/core/enums/status_enum.dart';

class BannerRepoImpl extends BannerRepo {
  final DioClient dioClient;

  BannerRepoImpl({required this.dioClient});

  @override
  Future<ApiResponse<BannerModel>> getBanners() async {
    try {
      final response = await dioClient.get("/banners");

      final model = BannerModel.fromJson(response.data);

      return ApiResponse(
        status: Status.success,
        message: "Success",
        data: model,
      );
    } catch (e) {
      return ApiResponse(status: Status.error, message: e.toString());
    }
  }

  @override
  Future<ApiResponse<void>> createBanner(BannerModel banner) async {
    return ApiResponse(status: Status.success, message: "Not implemented yet");
  }

  @override
  Future<ApiResponse<void>> deleteBanner(int id) async {
    return ApiResponse(status: Status.success, message: "Not implemented yet");
  }

  @override
  Future<ApiResponse<BannerModel>> getBannerById(int id) async {
    return ApiResponse(status: Status.success, message: "Not implemented yet");
  }

  @override
  Future<ApiResponse<void>> updateBanner(int id, BannerModel banner) async {
    return ApiResponse(status: Status.success, message: "Not implemented yet");
  }
}
