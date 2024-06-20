class ChangeLanguageModel {
  final String? country;
  final String? language;

  const ChangeLanguageModel({required this.country, required this.language});
}

final listOfLanguage = [
  ChangeLanguageModel(country: "Uzbekistan", language: "Uzbek"),
  ChangeLanguageModel(country: "Russia", language: "Russian"),
  ChangeLanguageModel(country: "United States of America", language: "English"),
  ChangeLanguageModel(country: "Japan", language: "Japanase")
];
