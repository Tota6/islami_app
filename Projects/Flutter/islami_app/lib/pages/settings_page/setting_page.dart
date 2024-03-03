import 'package:flutter/material.dart';
import 'package:islami_app/pages/settings_page/languge_button_sheet.dart';
import 'package:islami_app/pages/settings_page/theme_button_sheet.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../provider/settings_provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
                child: Text(
                  AppLocalizations.of(context)!.theme,
                  style: TextStyle(
                      color: provider.currentTheme == ThemeMode.light
                          ? AppColors.lightPrimaryColor
                          : AppColors.darkSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              InkWell(
                onTap: () {
                  showThemeSheet();
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: provider.currentTheme == ThemeMode.light
                            ? AppColors.lightTextColor
                            : AppColors.darkSecondaryColor,
                        width: 3,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20, right: 20, bottom: 10),
                        child: Text(
                          provider.currentTheme == ThemeMode.light
                              ? AppLocalizations.of(context)!.light_mood
                              : AppLocalizations.of(context)!.dark_mood,
                          style: TextStyle(
                              color: provider.currentTheme == ThemeMode.light
                                  ? AppColors.lightTextColor
                                  : AppColors.darkSecondaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: provider.currentTheme == ThemeMode.light
                              ? AppColors.lightTextColor
                              : AppColors.darkSecondaryColor,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  AppLocalizations.of(context)!.language,
                  style: TextStyle(
                      color: provider.currentTheme == ThemeMode.light
                          ? AppColors.lightPrimaryColor
                          : AppColors.darkSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              InkWell(
                onTap: () {
                  showLanguageSheet();
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(
                        color: provider.currentTheme == ThemeMode.light
                            ? AppColors.lightTextColor
                            : AppColors.darkSecondaryColor,
                        width: 3,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          provider.currentLanguage == "en"
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: TextStyle(
                            color: provider.currentTheme == ThemeMode.light
                                ? AppColors.lightTextColor
                                : AppColors.darkSecondaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: provider.currentTheme == ThemeMode.light
                              ? AppColors.lightTextColor
                              : AppColors.darkSecondaryColor,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  showLanguageSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageButtomSheet(),
    );
  }

  showThemeSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeButtomSheet(),
    );
  }
}
