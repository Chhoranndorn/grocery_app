import 'package:grocery_app/core/enums/status_enum.dart';

class ApiResponse<T> {
  final Status status;
  final String message;
  final T? data;

  ApiResponse({required this.status, required this.message, this.data});
}
