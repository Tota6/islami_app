import 'package:flutter/material.dart';
import 'package:islami_app/pages/settings_page/languge_button_sheet.dart';
import 'package:islami_app/pages/settings_page/theme_button_sheet.dart';
import 'package:islami_app/utilities/app_colors.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
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
                  "Theme",
                  style: TextStyle(
                      color: AppColors.isDarkSelected
                          ? AppColors.darkSecondaryColor
                          : AppColors.lightTextColor,
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
                        color: AppColors.isDarkSelected
                            ? AppColors.darkSecondaryColor
                            : AppColors.lightTextColor,
                        width: 3,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20, bottom: 10),
                        child: Text(
                          "Light",
                          style: TextStyle(
                              color: AppColors.isDarkSelected
                                  ? AppColors.darkSecondaryColor
                                  : AppColors.lightTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.isDarkSelected
                              ? AppColors.darkSecondaryColor
                              : AppColors.lightTextColor,
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
                  "Language",
                  style: TextStyle(
                      color: AppColors.isDarkSelected
                          ? AppColors.darkSecondaryColor
                          : AppColors.lightTextColor,
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
                        color: AppColors.isDarkSelected
                            ? AppColors.darkSecondaryColor
                            : AppColors.lightTextColor,
                        width: 3,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "English",
                          style: TextStyle(
                            color: AppColors.isDarkSelected
                                ? AppColors.darkSecondaryColor
                                : AppColors.lightTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.isDarkSelected
                              ? AppColors.darkSecondaryColor
                              : AppColors.lightTextColor,
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
      builder: (context) => LangugeButtomSheet(),
    );
  }

  showThemeSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeButtomSheet(),
    );
  }
}
