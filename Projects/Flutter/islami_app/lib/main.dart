import 'package:flutter/material.dart';
import 'package:islami_app/pages/hadeth_page/page/hadeth_details_page.dart';
import 'package:islami_app/pages/home_page/home_page.dart';
import 'package:islami_app/pages/quran_page/pages/sura_details.dart';
import 'package:islami_app/pages/splash_page/splash_page.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Color(0xff242424),
          ),
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 35),
          backgroundColor: Color(0xffB7935F),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color(0xffB7935F),
          elevation: 2,
          iconTheme: MaterialStatePropertyAll(
            IconThemeData(
              size: 40,
            ),
          ),
        ),
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffB7935F),
        ),
        cardColor: Colors.white,
        useMaterial3: true,
      ),
      routes: {
        SplashPage.routeName: (_) => const SplashPage(),
        HomePage.routeName: (_) => const HomePage(),
        SuraDetailsPage.routeName: (_) => const SuraDetailsPage(),
        HadethDetailsPage.routeName: (_) => const HadethDetailsPage(),
      },
      initialRoute: HomePage.routeName,
      home: const Directionality(
          textDirection: TextDirection.rtl, child: HomePage()),
    );
  }
}
