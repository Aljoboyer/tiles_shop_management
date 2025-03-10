class AuthService {
  static bool isLoggedIn = false; // Replace with actual login logic

  static void login() {
    isLoggedIn = true;
  }

  static void logout() {
    isLoggedIn = false;
  }
}
