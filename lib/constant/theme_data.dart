import 'package:flutter/material.dart';
import 'package:news_createv_app/constant/app_colors.dart';
 
//Light theme
Color lightScaffoldColor = const Color(0xFFF5F5F5);
Color lightCardColor = const Color(0xFFFfFFFf); //F0FFFF
Color lightBackgroundColor = const Color(0xFFD0E8F2);
Color lightIconsColor = const Color(0xFF79A3B1);
//  Color lightTextColor = const Color(0xff324558);
//Dark theme
Color darkScaffoldColor = const Color(0xFF1A1A2E);
Color darkCardColor = const Color(0xFF001429);
Color darkBackgroundColor = const Color(0xFF0F3460);
// Color darkIconsColor = const Color(0xFFE94560);
Color darkIconsColor = AppColors.primaryDeep;

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? darkScaffoldColor : lightScaffoldColor,
      primaryColor: isDarkTheme ? darkCardColor : lightCardColor,
      hintColor: isDarkTheme ? Colors.grey.shade400 : Colors.grey.shade700,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: isDarkTheme ? Colors.white : Colors.black,
        selectionColor: Colors.blue,

        // selectionHandleColor: Colors.blue,
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: isDarkTheme ? Colors.white : Colors.black,
            displayColor: isDarkTheme ? Colors.white : Colors.black,
          ),
      cardColor: isDarkTheme ? darkCardColor : lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light, colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme ? darkIconsColor : lightIconsColor,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ).copyWith(background: isDarkTheme ? darkBackgroundColor : lightBackgroundColor),
    );
  }
}
