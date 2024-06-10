import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsConstants {
  static const loginKey='login_data';
  SharedPrefsConstants._internal();

  static final SharedPrefsConstants _instance = SharedPrefsConstants._internal();

  factory SharedPrefsConstants() {
    return _instance;
  }

  SharedPreferences? _prefs;

  Future<SharedPreferences> get _instancePrefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<void> setLogin( String value) async {
    final prefs = await _instancePrefs;
    await prefs.setString(loginKey, value);
  }

  Future<String?> getLogin() async {
    final prefs = await _instancePrefs;
    return prefs.getString(loginKey);
  }

Future<void> clearData()async{
if(_prefs!=null){
  _prefs?.clear();
}
}

  // Add more methods as needed
}
