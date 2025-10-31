import 'package:nylo_framework/nylo_framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class LogoutEvent implements NyEvent {
//   @override
//   final listeners = {
//     DefaultListener: DefaultListener(),
//   };
// }

// class DefaultListener extends NyListener {
//   @override
//   handle(dynamic event) async {
//     await Auth.logout();

//     routeToInitial();
//   }
// }

class LogoutEvent implements NyEvent {
  @override
  final listeners = {
    FirebaseListener: FirebaseListener(),
  };
}

class FirebaseListener extends NyListener {
  @override
  handle(dynamic event) async {
    // logout from firebase
    await FirebaseAuth.instance.signOut();
  }
}