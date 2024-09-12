// lib/authenticator.dart

// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:dartfrog_backend/user.dart';
import 'package:postgres/postgres.dart';
import 'package:uuid/uuid.dart';

class Authenticator {

  Authenticator(this.client);
  
  Connection client;

  Future<AuthenticatedUser?> registerUser({
    required String username,
    required String password,
  }) async {
    const uuid = Uuid();
    final result = await client.execute(
      r'INSERT INTO user (id, username, password_hash) VALUES ($1, $2, $3) returning id', 
    parameters: [uuid.v4(), username, '${password}hash'],);
    if (result.length == 1) {
      return AuthenticatedUser(
        id: result[0][0]! as String,
        name: username,
        token: username,
      );
    }

    return null;
  }

// Future<AuthenticatedUser?> findByUsernameAndPassword({
//     required PrismaClient client,
//     required String username,
//     required String password,
//   }) async {
//     final user = await client.user.findFirst(
//       where: UserWhereInput(
//         username: PrismaUnion.$1(StringFilter(
//           equals: PrismaUnion.$1(username),
//         ),),
//       ),);

//     if (user != null && user.passwordHash == '${password}hash') {
//       return AuthenticatedUser(
//         id: user.id!,
//         name: user.username!,
//         token: 'token',
//       );
//     }
//     return null;
//   }

  bool verifyToken(String token, String username) {
    return token == username;
  }
}
