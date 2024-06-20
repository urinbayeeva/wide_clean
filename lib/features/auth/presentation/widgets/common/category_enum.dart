// ignore_for_file: constant_identifier_names

enum Categories {
  Nasihat,
  AvtoOlam,
  Informativ,
  LifeHack,
  Podcast,
  Motivatsiyalar,
  Talim,
  Sayohat,
  Vlog,
  Sport,
  Salomatlik,
  Tibbiyot,
  Yuridik,
  Qurilmalar,
  Animatsion,
  Tabiat,
  Tarix,
  Faktlar,
  Texnologiyalar,
  Ibrat,
  Uzbek,
  Boshqalar
}

extension CategoryExtension on Categories {
  String get name {
    switch (this) {
      case Categories.Nasihat:
        return 'Nasihat';
      case Categories.AvtoOlam:
        return 'Avto Olam';
      case Categories.Informativ:
        return 'Informativ';
      case Categories.LifeHack:
        return 'Life-Hack';
      case Categories.Podcast:
        return 'Podcast';
      case Categories.Motivatsiyalar:
        return 'Motivatsiyalar';
      case Categories.Talim:
        return "Ta'lim";
      case Categories.Sayohat:
        return 'Sayohat';
      case Categories.Vlog:
        return 'Vlog';
      case Categories.Sport:
        return 'Sport';
      case Categories.Salomatlik:
        return 'Salomatlik';
      case Categories.Tibbiyot:
        return 'Tibbiyot';
      case Categories.Yuridik:
        return 'Yuridik';
      case Categories.Qurilmalar:
        return 'Qurilmalar obzori';
      case Categories.Animatsion:
        return 'Animatsion';
      case Categories.Tabiat:
        return 'Tabiat';
      case Categories.Tarix:
        return 'Tarix';
      case Categories.Faktlar:
        return 'Faktlar';
      case Categories.Texnologiyalar:
        return 'Texnologiyalar';
      case Categories.Ibrat:
        return 'Ibrat';
      case Categories.Uzbek:
        return "O'zbek";
      case Categories.Boshqalar:
        return 'Boshqalar +';
      default:
        return "";
    }
  }
}
