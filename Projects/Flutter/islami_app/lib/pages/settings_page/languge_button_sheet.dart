import 'package:flutter/material.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:provider/provider.dart';

import '../../provider/settings_provider.dart';

class LanguageButtomSheet extends StatefulWidget {
  const LanguageButtomSheet({super.key});

  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: provider.currentLanguage == "en"
                ? getSelectedItem("English")
                : getUnSelectedItem("English"),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: provider.currentLanguage == "ar"
                ? getSelectedItem("Arabic")
                : getUnSelectedItem("Arabic"),
          )
        ],
      ),
    );
  }

  getSelectedItem(String language) {
    var provider = Provider.of<SettingProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: TextStyle(
            color: provider.currentTheme == ThemeMode.light
                ? AppColors.lightPrimaryColor
                : AppColors.darkSecondaryColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.check,
          size: 30,
          color: provider.currentTheme == ThemeMode.light
              ? AppColors.lightPrimaryColor
              : AppColors.darkSecondaryColor,
        ),
      ],
    );
  }

  getUnSelectedItem(String language) {
    var provider = Provider.of<SettingProvider>(context);

    return Row(
      children: [
        Text(
          language,
          style: TextStyle(
            color: provider.currentTheme == ThemeMode.light
                ? AppColors.lightPrimaryColor
                : AppColors.darkSecondaryColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
