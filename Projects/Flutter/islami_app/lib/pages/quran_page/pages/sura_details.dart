import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/pages/quran_page/models/sura_model.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:islami_app/utilities/app_theme.dart';
import 'package:provider/provider.dart';

class SuraDetailsPage extends StatefulWidget {
  static String routeName = "SuraDetailsPage ";

  const SuraDetailsPage({super.key});

  @override
  State<SuraDetailsPage> createState() => _SuraDetailsPageState();
}

class _SuraDetailsPageState extends State<SuraDetailsPage> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraModel arg = ModalRoute.of(context)?.settings.arguments as SuraModel;
    var provider = Provider.of<SettingProvider>(context);
    if (verses.isEmpty) {
      readFileDetails(arg.index);
    }
    return verses.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              Image.asset(
                provider.changeBackground(),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Scaffold(
                appBar: AppBar(
                  iconTheme: Theme.of(context).iconTheme,
                  title: Text(
                    "اسلامى",
                    style: TextStyle(
                      color: provider.currentTheme == ThemeMode.light
                          ? AppColors.lightTextColor
                          : AppColors.whiteColor,
                    ),
                  ),
                ),
                body: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Card(
                    color: provider.currentTheme == ThemeMode.light
                        ? AppColors.whiteColor
                        : AppColors.darkNavBarColor,
                    margin: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            bottom:
                                4, // This can be the space you need between text and underline
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 100),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: provider.currentTheme == ThemeMode.light
                                    ? AppColors.lightPrimaryColor
                                    : AppColors.darkSecondaryColor,
                                width:
                                    2.0, // This would be the width of the underline
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  arg.suraName,
                                  style:
                                      provider.currentTheme == ThemeMode.light
                                          ? AppThemeData
                                              .lightTheme.textTheme.titleMedium
                                          : AppThemeData
                                              .darkTheme.textTheme.titleMedium,
                                ),
                                Icon(
                                  Icons.play_circle,
                                  color:
                                      provider.currentTheme == ThemeMode.light
                                          ? AppColors.lightPrimaryColor
                                          : AppColors.darkSecondaryColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.all(30),
                              alignment: Alignment.center,
                              child: Text(
                                verses[index],
                                style: provider.currentTheme == ThemeMode.light
                                    ? AppThemeData
                                        .lightTheme.textTheme.bodyMedium
                                    : AppThemeData
                                        .darkTheme.textTheme.bodyMedium,
                              ),
                            ),
                            itemCount: verses.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }

  void readFileDetails(int index) async {
    String fileContent =
        await rootBundle.loadString("assets/assets/${index + 1}.txt");
    List<String> suraLines = fileContent.split("/n");
    verses = suraLines;
    for (int i = 0; i <= suraLines.length; i++) {
      setState(
        () {},
      );
    }
  }
}
