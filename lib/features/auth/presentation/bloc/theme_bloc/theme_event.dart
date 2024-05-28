// presentation/blocs/theme_event.dart

import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/domain/entities/app_theme.dart';

@immutable
abstract class ThemeEvent {}

class LoadTheme extends ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  final AppTheme theme;

  ChangeTheme(this.theme);
}
