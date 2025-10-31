import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:nylo_framework/nylo_framework.dart';
import '../../firebase_options.dart';

class FirebaseProvider implements NyProvider {

  @override
  boot(Nylo nylo) async {
   
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      if (getEnv('APP_DEBUG') == true) {
        try {
          // FirebaseFunctions.instance.useEmulator('localhost', 5001);
          await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
          FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
        } catch (e) {
          // ignore: avoid_print
          print(e);
        }
      }

      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          routeToInitial();
        }
      });
      
     return nylo;
  }
  
  @override
  afterBoot(Nylo nylo) async {
   
     // Called after Nylo has finished booting
     // ...
  }
}
