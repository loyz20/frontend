// domain/models/user_model.dart
class User {
  final int id;
  final String email;
  final String role;
  final String token;

  User({
    required this.id,
    required this.email,
    required this.role,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['user_id'],
    email: json['email'],
    role: json['role'],
    token: json['token'],
  );
}
