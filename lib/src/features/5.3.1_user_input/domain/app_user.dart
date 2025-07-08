class AppUser {
  final String userName;
  final String email;
  final String password;

  AppUser({
    required this.userName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      userName: map['userName'],
      email: map['email'],
      password: map['password'],
    );
  }
}
