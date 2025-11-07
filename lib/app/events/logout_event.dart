import 'package:invoicefoxy_all/app/providers/pocketbase_provider.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogoutEvent implements NyEvent {
  @override
  final listeners = {
    DefaultListener: DefaultListener(),
  };
}

class DefaultListener extends NyListener {
  @override
  handle(dynamic event) async {
    //OwnPocketBase.instance.authStore.clear();
    await Supabase.instance.client.auth.signOut()
    .then((value) => Auth.logout())
    .then((value) => routeToInitial());
  }
}

// class LogoutEvent implements NyEvent {
//   @override
//   final listeners = {
//     FirebaseListener: FirebaseListener(),
//   };
// }

// class FirebaseListener extends NyListener {
//   @override
//   handle(dynamic event) async {
//     // logout from firebase
//     await FirebaseAuth.instance.signOut();
//   }
// }