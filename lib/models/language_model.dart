class LanguageModel {
  final String flag;
  final String name;
  final String languageCode;

  LanguageModel(
    this.flag,
    this.name,
    this.languageCode,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LanguageModel && other.languageCode == languageCode;
  }

  @override
  int get hashCode => languageCode.hashCode;

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel("🇺🇸", "English", 'en'),
      LanguageModel("🇮🇳", "हिंदी", 'hi'),
      // Add more languages as needed
    ];
  }
}
