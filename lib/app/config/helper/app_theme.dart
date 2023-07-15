/* import 'package:get_storage/get_storage.dart';

import '/index.dart';

class AppTheme {
  ///Themes

  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey.shade300,
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.black12,
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.white54,
  );

  final _getStorage = GetStorage();

  final _darkThemeKey = "isDarkTheme";

  void _saveThemeData(bool isDarkMode) =>
      _getStorage.write(_darkThemeKey, isDarkMode);

  bool isSavedDarkMode() => _getStorage.read(_darkThemeKey) ?? false;

  ThemeMode getThemeMode() =>
      isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    _saveThemeData(!isSavedDarkMode());
  }
}
 */