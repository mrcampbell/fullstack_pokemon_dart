// lib/_middleware.dart
// ignore_for_file: public_member_api_docs

import 'package:dart_frog/dart_frog.dart';
import 'package:dartfrog_backend/auth/authenticator.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<Authenticator>(
      (_) => Authenticator(),
    ),
  );
}