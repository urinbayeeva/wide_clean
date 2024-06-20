import 'package:wide_clean/config/theme/dark_app_textstyle.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

class CustomTheme {
  static final ThemeMode themeMode = ThemeMode.system;

  static final ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Geometria",
    primaryColor: AppColors.mainColor,
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyle.chooseLanguagePage,
      bodyMedium: AppTextStyle.chooseLoginPage,
      titleMedium: AppTextStyle.textFieldHintStyle,
    ),
  );

  static final ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Geometria",
    primaryColor: AppColors.darkMainColor,
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: DarkAppTextStyle.chooseLanguagePage,
      bodyMedium: DarkAppTextStyle.chooseLoginPage,
      titleMedium: DarkAppTextStyle.textFieldHintStyle,
    ),
  );
}
