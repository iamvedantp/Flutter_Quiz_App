class MockDatabase {
  static final List<Map<String, String>> users = [
    {
      'email': 'tester@example.com',
      'mobile': '1234567890',
      'password': 'password123',
    },
  ];

  static bool isValidUser(String emailOrMobile, String password) {
    return users.any((user) =>
        (user['email'] == emailOrMobile || user['mobile'] == emailOrMobile) &&
        user['password'] == password);
  }

  static bool isEmailOrMobileExists(String emailOrMobile) {
    return users.any((user) =>
        user['email'] == emailOrMobile || user['mobile'] == emailOrMobile);
  }

  static void addUser(String email, String mobile, String password) {
    users.add({
      'email': email,
      'mobile': mobile,
      'password': password,
    });
  }
}
