class UserModel {
  final String phone;
  final String name;
  UserModel({required this.phone, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(phone: json['phone'] ?? '', name: json['name'] ?? '');
  }
}
