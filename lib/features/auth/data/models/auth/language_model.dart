// ignore: constant_identifier_names
enum Language { Uzbek, Russian, English }

extension LanguageExtension on Language {
  String get displayName {
    switch (this) {
      case Language.Uzbek:
        return "O'zbekcha";
      case Language.Russian:
        return "Ruscha";
      case Language.English:
        return "Inglizcha";
      default:
        return '';
    }
  }
}
