import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:invoicefoxy_all/config/keys.dart';


class SupabaseProvider implements NyProvider {

  @override
  boot(Nylo nylo) async {
   
    final supabase = await Supabase.initialize(
      url: getEnv('SUPABASE_URL'),
      anonKey: getEnv('SUPABASE_TOKEN'),
      debug: getEnv('APP_DEBUG')
    );

    supabase.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      if(event == AuthChangeEvent.signedOut) {
        _handleSignOut();
      }
    });
   
     return nylo;
  }
  
  @override
  afterBoot(Nylo nylo) async {
   
     // Called after Nylo has finished booting
     // ...
  }

  _handleSignOut() {
    Auth.logout();
    Keys.companySelected.deleteFromStorage(andFromBackpack: true);
  }
}
