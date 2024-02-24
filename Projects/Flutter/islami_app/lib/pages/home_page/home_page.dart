import 'package:flutter/material.dart';
import 'package:islami_app/pages/hadeth_page/hadeth_page.dart';
import 'package:islami_app/pages/quran_page/quran_page.dart';
import 'package:islami_app/pages/radio_page/radio_page.dart';
import 'package:islami_app/pages/sebha_page/sebha_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = "Home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedIndex = 0;
List<Widget> tabs = [RadioPage(), SebhaPage(), HadethPage(), QuranPage()];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/default_bg.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: const Text("اسلامى"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color(0xffB7935F),
              icon: ImageIcon(
                AssetImage(
                  "assets/images/icon_radio.png",
                ),
              ),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffB7935F),
              icon: ImageIcon(
                size: 42,
                AssetImage(
                  "assets/images/icon_sebha.png",
                ),
              ),
              label: "Sebha",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffB7935F),
              icon: ImageIcon(
                AssetImage(
                  "assets/images/icon_hadeth.png",
                ),
              ),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffB7935F),
              icon: ImageIcon(
                size: 40,
                AssetImage(
                  "assets/images/icon_quran.png",
                ),
              ),
              label: "Quran",
            ),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    ]);
  }
}
