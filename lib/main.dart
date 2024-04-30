import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:dentist_appointment/screens/AuthPage.dart';
import 'theme_config.dart';
import 'theme_provider.dart';
import 'localization/Language/languages.dart'; // Import your language utilities
import 'localization/Language/language_en.dart'; // Import English language implementation
import 'localization/Language/language_hi.dart'; // Import Hindi language implementation

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeStateProvider(),
        ),
        // Provider for the custom localization class
        ChangeNotifierProvider<Localization>(
          create: (_) => Localization(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeStateProvider, Localization>(
      builder: (context, theme, localization, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
          themeMode: theme.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          locale: localization.locale,
          supportedLocales: [
            const Locale('en', ''),
            const Locale('hi', ''),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: AuthPage(),
        );
      },
    );
  }

  // Static method to set the app's locale
  static void setLocale(BuildContext context, Locale newLocale) {
    Provider.of<Localization>(context, listen: false).setLocale(newLocale);
  }
}

// Custom localization class
class Localization with ChangeNotifier {
  Locale _locale = const Locale('en', ''); // Default locale is English
  Languages _currentLanguage = EnglishLanguage(); // Default language is English

  Locale get locale => _locale;
  Languages get currentLanguage => _currentLanguage;

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    _currentLanguage =
        newLocale.languageCode == 'hi' ? HindiLanguage() : EnglishLanguage();
    notifyListeners();
  }
}
