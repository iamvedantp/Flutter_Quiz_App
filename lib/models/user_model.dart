class User {
  final String email;
  final String mobile;
  final String password;

  User({required this.email, required this.mobile, required this.password});
}

// Mock Database
List<User> mockUsers = [
  User(email: "tester1@gmail.com", mobile: "1234567890", password: "test123"),
  User(email: "tester2@gmail.com", mobile: "9876543210", password: "test456"),
];
