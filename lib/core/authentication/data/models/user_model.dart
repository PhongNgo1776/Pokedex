import 'package:realm/realm.dart';

part 'user_model.realm.dart';

@RealmModel()
class _UserModel {
  @PrimaryKey()
  late String id;
  late String name;
  late String email;
  late String phone;
  late String address;
  late String avatarUrl;
}

class UserModelUtils {
  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['id'] as String,
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['address'] as String,
      json['avatarUrl'] as String,
    );
  }
}
