import 'package:grocery_app/data/models/api_response.dart';
import 'package:grocery_app/data/models/user_model.dart';

abstract class AuthRepo {
  Future<ApiResponse<UserModel>> login(String email, String password);
  Future<ApiResponse<void>> sendOtp(String phoneNumber);
  Future<ApiResponse<UserModel>> verifyOtp(String phoneNumber, String otp);
}
