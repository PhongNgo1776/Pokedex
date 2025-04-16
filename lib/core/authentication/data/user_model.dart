class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );
  }
}
