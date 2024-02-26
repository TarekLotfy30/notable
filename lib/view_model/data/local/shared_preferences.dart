import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> set({required String key, required dynamic value}) async {
    if (value is int) {
      prefs?.setInt(key, value);
    } else if (value is double) {
      prefs?.setDouble(key, value);
    } else if (value is String) {
      prefs?.setString(key, value);
    } else if (value is bool) {
      prefs?.setBool(key, value);
    } else if (value is List<String>) {
      prefs?.setStringList(key, value);
    }
    return;
  }

  static dynamic get({required String key}) {
    return prefs?.get(key);
  }

  static void remove({required String key}) {
    prefs?.remove(key);
  }

  static void clearAllData() {
    prefs?.clear();
  }
}

//calling the shared preference
/*
    onpressed : (){
    SharedPreference.set(key:"islogin" , value : true);
    }
*/
