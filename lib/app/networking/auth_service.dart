import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/providers/pocketbase_provider.dart';
import '/app/models/user.dart';
import '/config/decoders.dart';
import '/config/keys.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthService extends NyApiService {
  AuthService({BuildContext? buildContext}) : super(buildContext);

  Future registerUser(String email, String password, String name) async {
    return await OwnPocketBase.instance.collection("users").create(
      body: {
        "name": name,
        "email": email, 
        "password": password, 
        "passwordConfirm": password, 
      }
    );
  }

  Future loginWithPassword(String identity, String password) async {
    return await OwnPocketBase.instance.collection("users").authWithPassword(identity, password).then((result) {
      return User.fromRecord(result.record);
    });
      
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