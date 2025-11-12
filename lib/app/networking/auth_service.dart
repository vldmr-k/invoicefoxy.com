import 'package:flutter/material.dart';
import '/config/decoders.dart';
import '/config/keys.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends NyApiService {
  AuthService({BuildContext? buildContext}) : super(buildContext);

  Future<AuthResponse> registerUser(String email, String password, String name) async {
    return await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> loginWithPassword(String identity, String password) async {
    return await Supabase.instance.client.auth.signInWithPassword(
      email: identity,
      password: password,
    );
  }

  Future<dynamic> refreshUserToken(String refreshToken) async {
    return await network(
      request: (request) => request.post("/collections/users/auth-refresh"),
    );
  }

  /// Request password reset
  Future<dynamic> requestPasswordReset(String email) async {
    return await network(
      request: (request) => request.post("/collections/users/request-password-reset", data: {"email": email}),
    );
  }

  /// Confirm password reset
  Future<dynamic> confirmPasswordReset(String resetToken, String password, String passwordConfirm) async {
    return await network(
      request: (request) => request.post("/collections/users/confirm-password-reset", data: {"resetToken": resetToken, "password": password, "passwordConfirm": passwordConfirm}),
    );
  }

}