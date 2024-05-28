// presentation/blocs/theme_state.dart
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/domain/entities/app_theme.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final AppTheme theme;

  ThemeLoaded(this.theme);
}

class ThemeError extends ThemeState {
  final String message;

  ThemeError(this.message);
}
