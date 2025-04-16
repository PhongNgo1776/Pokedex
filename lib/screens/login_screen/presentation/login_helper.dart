class LoginHelper {
  static bool isValidUsername(String? userName) => (userName?.length ?? 0) > 3;
  static bool isValidPassword(String? password) => (password?.length ?? 0) > 6;
}
