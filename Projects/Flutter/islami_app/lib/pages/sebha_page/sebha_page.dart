import 'package:flutter/material.dart';
import 'package:islami_app/utilities/app_colors.dart';

class SebhaPage extends StatefulWidget {
  const SebhaPage({super.key});

  @override
  State<SebhaPage> createState() => _SebhaPageState();
}

class _SebhaPageState extends State<SebhaPage> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> tasbehatList = [
    "سبحان الله",
    "الحمدالله",
    "الله اكبر",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.086),
                  child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(AppColors.isDarkSelected
                          ? "assets/images/body_sebha_dark.png"
                          : "assets/images/body_sebha_logo.png")),
                ),
                Image.asset(AppColors.isDarkSelected
                    ? "assets/images/head_sebha_dark.png"
                    : "assets/images/head_sebha_logo.png"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "عدد التسبيحات",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.isDarkSelected
                      ? AppColors.darkNavBarColor
                      : AppColors.lightSecondaryColor),
              child: Text(
                counter.toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              tasbeh();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: AppColors.isDarkSelected
                        ? AppColors.darkSecondaryColor
                        : AppColors.lightPrimaryColor),
                child: Text(
                  tasbehatList[index],
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void tasbeh() {
    if (index < 2) {
      if (counter < 33) {
        angle += 0.5;
        counter++;
      } else {
        index++;
        tasbehatList[index];
        counter = 0;
      }
    } else {
      index = 0;
      counter = 0;
    }
  }
}
