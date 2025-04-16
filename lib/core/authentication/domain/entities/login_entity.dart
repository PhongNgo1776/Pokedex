class LoginEntity {
  final String userName;
  final String password;

  LoginEntity({
    required this.userName,
    required this.password,
  });

  @override
  String toString() {
    return 'LoginEntity(email: $userName, password: $password)';
  }
}
