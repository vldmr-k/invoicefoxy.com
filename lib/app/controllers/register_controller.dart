import 'package:invoicefoxy_all/app/networking/auth_service.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';
import 'package:nylo_framework/nylo_framework.dart';


class RegisterController extends Controller {

  /// Register the user
  register(String name, String email, String password) async {

    try {
      final result = await api<AuthService>(
          (request) => request.registerUser(email, password, name)
      );

      await Auth.authenticate(data: result.user);
      //showToastSuccess(description: 'Welcome ${result.user.name ?? ''}!');
      routeToAuthenticatedRoute();
    
    } catch (error) {
      showToastSorry(description: error.toString());
    }

    // final result = await api<AuthService>(
    //     (request) => request.registerUser(email, password, name),
    //     onSuccess: (response, user) {
    //       printDebug("user: $user.toJson()");
    //       showToastSuccess(description: 'Welcome ${user?.name ?? ''}!');
    //     },
    //     onError: (DioException dioError) {
    //       dynamic response = dioError.response?.data;
    //       int statusCode = dioError.response?.statusCode ?? 0;
    //       if(response['data']?['email']?['code'] == 'validation_not_unique') {
    //         showToastSorry(description: 'The email provided is already in use.');
    //         return;
    //       }
    //       showToastSorry(description: '${dioError.message}');
    //       return;
    //     }
    // );
  }
}


// on fb.FirebaseAuthException catch (firebaseAuthException) {
//       if (firebaseAuthException.code == 'weak-password') {
//         showToastSorry(description: 'The password provided is too weak.');
//         return;
//       } 
//       if (firebaseAuthException.code == 'invalid-email') {
//         showToastSorry(description: 'The email provided is invalid.');
//         return;
//       }
//       if (firebaseAuthException.code == 'email-already-in-use') {
//         showToastSorry(description: 'The account already exists for that email.');
//         return;
//       }
//       if (firebaseAuthException.code == 'operation-not-allowed') {
//         showToastSorry(description: 'Something went wrong, please try again later.');
//         return;
//       }
//       if (firebaseAuthException.code == 'too-many-requests') {
//         showToastSorry(description: 'Too many requests, please try again later.');
//         return;
//       }
//       if (firebaseAuthException.code == 'user-token-expired') {
//         showToastSorry(description: 'Please try again.');
//         printError('The user is no longer authenticated since his refresh token has been expired.');
//         return;
//       }
//       if (firebaseAuthException.code == 'network-request-failed') {
//         showToastSorry(description: 'Please check your internet connection.');
//         return;
//       }
//     }