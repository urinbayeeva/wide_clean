import 'package:wide_clean/features/auth/domain/entities/app_theme.dart';

abstract class ThemeRepository {
  Future<AppTheme> getCurrentTheme();
}
