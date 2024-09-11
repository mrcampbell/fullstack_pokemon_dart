// lib/user.dart
// ignore_for_file: public_member_api_docs

class User {
  const User({
    required this.id,
    required this.name,
    required this.password,
  });

  final String id;
  final String name;
  final String password;
}