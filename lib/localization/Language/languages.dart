import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  String get labelWelcome;

  String get labelInfo;

  String get labelChangeLanguage;

  String get labelSelectLanguage;
}

class EnglishLanguage implements Languages {
  @override
  String get appName => "My App";

  @override
  String get labelWelcome => "Welcome";

  @override
  String get labelInfo => "Info";

  @override
  String get labelChangeLanguage => "Change Language";

  @override
  String get labelSelectLanguage => "Select Language";
}

class HindiLanguage implements Languages {
  @override
  String get appName => "मेरा ऐप";

  @override
  String get labelWelcome => "स्वागत है";

  @override
  String get labelInfo => "जानकारी";

  @override
  String get labelChangeLanguage => "भाषा बदलें";

  @override
  String get labelSelectLanguage => "भाषा चुनें";
}
