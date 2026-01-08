import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'pages/CheckListPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase'i başlat
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('tr'); // başlangıç dili TR
  bool _isDarkMode = true; // başlangıç modu dark

  void _changeLocale(Locale locale) {
    setState(() => _locale = locale);
  }

  void _changeTheme(bool isDark) {
    setState(() => _isDarkMode = isDark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [
        Locale('tr'),
        Locale('en'),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.red.shade800,
        colorScheme: ColorScheme.light(
          primary: Colors.red.shade800,
          secondary: Colors.red.shade600,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.deepOrange.shade800,
        colorScheme: ColorScheme.dark(
          primary: Colors.deepOrange.shade800,
          secondary: Colors.deepOrange.shade600,
        ),
      ),
      home: CheckListPage(
        onLocaleChange: _changeLocale,
        isDarkMode: _isDarkMode,
        onThemeChange: _changeTheme,
      ),
    );
  }
}
