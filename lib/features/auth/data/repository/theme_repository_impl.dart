import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/data/repository/theme_repository.dart';
import 'package:wide_clean/features/auth/domain/entities/app_theme.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  @override
  Future<AppTheme> getCurrentTheme() async {
    // ignore: deprecated_member_use
    final brightness = MediaQueryData.fromView(WidgetsBinding.instance.window)
        .platformBrightness;
    return brightness == Brightness.dark ? AppTheme.dark : AppTheme.light;
  }
}
