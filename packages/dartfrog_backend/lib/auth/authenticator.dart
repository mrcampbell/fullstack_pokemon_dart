// lib/authenticator.dart

// ignore_for_file: public_member_api_docs

import 'package:dartfrog_backend/user.dart';

class Authenticator {
  static const _users = {
    'john': User(
      id: '1',
      name: 'John',
      password: '123',
    ),
    'jack': User(
      id: '2',
      name: 'Jack',
      password: '321',
    ),
  };

  static const _passwords = {
    // ⚠️ Never store user's password in plain text, these values are in plain text
    // just for the sake of the tutorial.
    'john': '123',
    'jack': '321',
  };

  User? findByUsernameAndPassword({
    required String username,
    required String password,
  }) {
    final user = _users[username];

    if (user != null && _passwords[username] == password) {
      return user;
    }

    return null;
  }
}
