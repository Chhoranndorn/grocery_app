import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:grocery_app/core/di/init.dart';
import 'package:grocery_app/core/enums/status_enum.dart';
import 'package:grocery_app/data/models/api_response.dart';
import 'package:grocery_app/data/models/user_model.dart';

class MockAuthRepo implements AuthRepo {
  // Store OTP temporarily (in real app this comes from server)
  String? _generatedOtp;

  /// Step 1: Send OTP
  @override
  Future<ApiResponse<void>> sendOtp(String phoneNumber) async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network

    // Generate fake 4-digit OTP
    _generatedOtp = (1000 + (Random().nextInt(9000))).toString();

    if (kDebugMode) {
      print('📲 OTP sent to $phoneNumber : $_generatedOtp');
    }

    return ApiResponse(
      status: Status.success,
      message: "OTP sent successfully",
    );
  }

  /// Step 2: Verify OTP
  @override
  Future<ApiResponse<UserModel>> verifyOtp(
    String phoneNumber,
    String otp,
  ) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network

    if (_generatedOtp == otp) {
      return ApiResponse(
        status: Status.success,
        message: "OTP verified successfully",
        data: UserModel(phone: phoneNumber, name: "Luffy"),
      );
    } else {
      return ApiResponse(status: Status.error, message: "Invalid OTP");
    }
  }

  @override
  Future<ApiResponse<UserModel>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email == "admin@gmail.com" && password == "123456") {
      return ApiResponse(
        status: Status.success,
        message: "Login successful",
        data: UserModel(phone: email, name: "Admin"),
      );
    } else {
      return ApiResponse(
        status: Status.error,
        message: "Invalid email or password",
      );
    }
  }

  @override
  Future<ApiResponse<void>> signup(
    String userName,
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    return ApiResponse(
      status: Status.success,
      message: "Signup successful",
      data: null,
    );
  }
}
