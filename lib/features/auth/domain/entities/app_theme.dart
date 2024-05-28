enum AppTheme { light, dark }

abstract class ThemeUseCase {
  Future<AppTheme> getCurrentTheme();
}
