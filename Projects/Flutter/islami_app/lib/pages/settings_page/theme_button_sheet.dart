import 'package:flutter/material.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:provider/provider.dart';

class ThemeButtomSheet extends StatefulWidget {
  const ThemeButtomSheet({super.key});

  @override
  State<ThemeButtomSheet> createState() => _ThemeButtomSheetState();
}

class _ThemeButtomSheetState extends State<ThemeButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: provider.currentTheme == ThemeMode.light
            ? AppColors.whiteColor
            : AppColors.darkPrimaryColor,
      ),
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changeNotifier(ThemeMode.light);
                AppColors.isDarkSelected = false;
              },
              child: provider.currentTheme == ThemeMode.light
                  ? getSelectedItem("Light")
                  : getUnSelectedItem("Light")),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              provider.changeNotifier(ThemeMode.dark);
              AppColors.isDarkSelected = true;
            },
            child: provider.currentTheme == ThemeMode.dark
                ? getSelectedItem("Dark")
                : getUnSelectedItem("Dark"),
          )
        ],
      ),
    );
  }

  getSelectedItem(String theme) {
    var provider = Provider.of<SettingProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          theme,
          style: TextStyle(
              color: provider.currentTheme == ThemeMode.light
                  ? AppColors.lightPrimaryColor
                  : AppColors.darkSecondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
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

  getUnSelectedItem(String theme) {
    var provider = Provider.of<SettingProvider>(context);

    return Row(
      children: [
        Text(
          theme,
          style: TextStyle(
              color: provider.currentTheme == ThemeMode.light
                  ? AppColors.lightTextColor
                  : AppColors.darkSecondaryTextColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
