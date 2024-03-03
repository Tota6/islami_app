import 'package:flutter/material.dart';
import 'package:islami_app/pages/hadeth_page/hadeth_page.dart';
import 'package:islami_app/pages/quran_page/quran_page.dart';
import 'package:islami_app/pages/radio_page/radio_page.dart';
import 'package:islami_app/pages/sebha_page/sebha_page.dart';
import 'package:islami_app/pages/settings_page/setting_page.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = "Home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedIndex = 0;
List<Widget> tabs = const [
  RadioPage(),
  SebhaPage(),
  HadethPage(),
  QuranPage(),
  SettingPage()
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Stack(children: [
      Image.asset(
        provider.changeBackground(),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: AppColors.isDarkSelected
                  ? AppColors.whiteColor
                  : AppColors.lightPrimaryColor),
          title: Text(
            AppLocalizations.of(context)!.appBar_title,
            style: TextStyle(
                color: AppColors.isDarkSelected
                    ? AppColors.whiteColor
                    : AppColors.lightTextColor),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/2.0x/icon_radio@2x.png",
                ),
              ),
              label: AppLocalizations.of(context)!.radio_page,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/2.0x/icon_sebha@2x.png",
                ),
              ),
              label: AppLocalizations.of(context)!.sebha_page,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/2.0x/icon_hadeth@2x.png",
                ),
              ),
              label: AppLocalizations.of(context)!.hadeth_page,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/2.0x/icon_quran@2x.png",
                ),
              ),
              label: AppLocalizations.of(context)!.quran_page,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(
                Icons.settings,
              ),
              label: AppLocalizations.of(context)!.settings_page,
            ),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    ]);
  }
}
