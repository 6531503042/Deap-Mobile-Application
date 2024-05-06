import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:dentist_appointment/screens/AuthPage.dart';
import 'theme_config.dart';
import 'theme_provider.dart';
import 'localization/Language/languages.dart'; // Import your language utilities


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseAppCheck.instance.activate();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeStateProvider(),
        ),
        ChangeNotifierProvider<Localization>(
          create: (_) => Localization(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          supportedLocales: const [
            Locale('en', ''),
            Locale('hi', ''),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const AuthPage(),
        );
      },
    );
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
