import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MockAuthRepo {
  // Store OTP temporarily (in real app this comes from server)
  String? _generatedOtp;

  /// Step 1: Send OTP
  Future<Response> sendOtp(String phoneNumber) async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network

    // Generate fake 4-digit OTP
    _generatedOtp = (1000 + (Random().nextInt(9000))).toString();

    if (kDebugMode) {
      print('📲 OTP sent to $phoneNumber : $_generatedOtp');
    }

    return Response(
      statusCode: 200,
      body: {
        "message": "OTP sent successfully",
        "otp": _generatedOtp, // you may hide in real app
      },
    );
  }

  /// Step 2: Verify OTP
  Future<Response> verifyOtp(String phoneNumber, String otp) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network

    if (_generatedOtp == otp) {
      return Response(
        statusCode: 200,
        body: {
          "message": "OTP verified successfully",
          "token": "mock_token_123",
          "user": {"phone": phoneNumber, "name": "Luffy"},
        },
      );
    } else {
      return Response(statusCode: 400, body: {"message": "Invalid OTP"});
    }
  }
}
