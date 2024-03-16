import 'package:flutter/material.dart';
import 'package:islami_app/pages/hadeth_page/page/hadeth_details_page.dart';
import 'package:islami_app/pages/home_page/home_page.dart';
import 'package:islami_app/pages/quran_page/pages/sura_details.dart';
import 'package:islami_app/pages/splash_page/splash_page.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'utilities/app_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SettingProvider()
      ..getLanguage()
      ..getTheme(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [Locale("en"), Locale("ar")],
      locale: Locale(provider.currentLanguage),
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: provider.currentTheme,
      routes: {
        SplashPage.routeName: (_) => const SplashPage(),
        HomePage.routeName: (_) => const HomePage(),
        SuraDetailsPage.routeName: (_) => const SuraDetailsPage(),
        HadethDetailsPage.routeName: (_) => const HadethDetailsPage(),
      },
      initialRoute: HomePage.routeName,
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}
