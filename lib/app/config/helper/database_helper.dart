import '../../../index.dart';

class DatabaseHelper {
  // static DatabaseHelper get to => Get.find<DatabaseHelper>();
  SharedPreferences? _prefs;

  Future<DatabaseHelper> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setInt(String key, int value) async {
    return await _prefs!.setInt(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs!.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs!.setStringList(key, value);
  }

  dynamic getString(String key) {
    return _prefs!.get(key) ?? '';
  }

  bool getBool(String key) {
    return _prefs!.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs!.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }

  bool containsKey(String key) {
    return _prefs!.containsKey(key);
  }
}
