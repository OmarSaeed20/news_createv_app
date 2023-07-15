/* import '/index.dart';

class AppThemeController extends GetxController {
  AppThemeController get to => Get.find();

  @override
  void onInit() {
    getCurrentAppTheme();
    super.onInit();
  }

  static const THEME_STATUS = "THEMESTATUS";

  var prefs = DatabaseHelper.to;
  _setDarkThe(bool value) async => await prefs.setBool(THEME_STATUS, value);

  bool _getTheme() => prefs.getBool(THEME_STATUS);

  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    _setDarkThe(value);
    update();
  }

  //Fetch the current theme
  void getCurrentAppTheme() {
    setDarkTheme = _getTheme();
  }
}
 */