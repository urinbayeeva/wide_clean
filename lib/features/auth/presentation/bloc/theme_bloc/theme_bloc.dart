// presentation/blocs/theme_bloc.dart

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:wide_clean/features/auth/domain/entities/app_theme.dart';
import 'package:wide_clean/features/auth/presentation/bloc/theme_bloc/theme_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeUseCase _themeUseCase;

  ThemeBloc(this._themeUseCase) : super(ThemeInitial());

  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is LoadTheme) {
      yield* _mapLoadThemeToState();
    } else if (event is ChangeTheme) {
      yield* _mapChangeThemeToState(event.theme);
    }
  }

  Stream<ThemeState> _mapLoadThemeToState() async* {
    try {
      final theme = await _themeUseCase.getCurrentTheme();
      yield ThemeLoaded(theme);
    } catch (_) {
      yield ThemeError("Failed to load theme");
    }
  }

  Stream<ThemeState> _mapChangeThemeToState(AppTheme theme) async* {
    try {
      yield ThemeLoaded(theme);
    } catch (_) {
      yield ThemeError("Failed to change theme");
    }
  }
}
