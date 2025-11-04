import 'package:invoicefoxy_all/config/keys.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OwnPocketBase extends PocketBase {
  static OwnPocketBase? _instance;

  OwnPocketBase._internal(AuthStore store)
      : super(getEnv('API_BASE_URL'), authStore: store);

  static Future<OwnPocketBase> create(AuthStore store) async {
    if (_instance != null) return _instance!;
    _instance = OwnPocketBase._internal(store);
    return _instance!;
  }

  static OwnPocketBase get instance {
    if (_instance == null) {
      throw Exception("OwnPocketBase not initialized. Call create() first!");
    }
    return _instance!;
  }
}

class PocketbaseProvider implements NyProvider {

  @override
  boot(Nylo nylo) async {

    final prefs = await SharedPreferences.getInstance();

    final store = AsyncAuthStore(
      save:    (String data) async => prefs.setString('pb_auth', data),
      initial: prefs.getString('pb_auth'),
    );
   
    // Create singleton instance with the store
    await OwnPocketBase.create(store);
   
     return nylo;
  }
  
  @override
  afterBoot(Nylo nylo) async {
   
     // Called after Nylo has finished booting
     // ...
      printDebug("Pocketbase health check Token: ${OwnPocketBase.instance.authStore.token}");

     OwnPocketBase.instance
      .health
      .check();
  }
}
