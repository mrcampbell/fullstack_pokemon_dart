// lib/user.dart
// ignore_for_file: public_member_api_docs

class AuthenticatedUser {
  const AuthenticatedUser({
    required this.id,
    required this.name,
    required this.token,
  });

  final String id;
  final String name;
  final String token;

}