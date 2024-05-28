import 'package:wide_clean/features/auth/data/repository/theme_repository.dart';
import 'package:wide_clean/features/auth/domain/entities/app_theme.dart';

class ThemeUseCaseImpl implements ThemeUseCase {
  final ThemeRepository _repository;

  ThemeUseCaseImpl(this._repository);

  @override
  Future<AppTheme> getCurrentTheme() async {
    return await _repository.getCurrentTheme();
  }
}
