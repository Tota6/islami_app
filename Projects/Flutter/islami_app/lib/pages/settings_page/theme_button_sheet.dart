import 'package:flutter/material.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:provider/provider.dart';

class ThemeButtomSheet extends StatelessWidget {
  const ThemeButtomSheet({super.key});

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
                provider.changeNotifier(ThemeMode.light);
                AppColors.isDarkSelected = false;
              },
              child: provider.currentTheme == ThemeMode.light
                  ? getSelectedItem("Ligth")
                  : getUnSelectedItem("Ligth")),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          theme,
          style: TextStyle(
              color: AppColors.isDarkSelected
                  ? AppColors.darkSecondaryColor
                  : AppColors.lightPrimaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.check,
          size: 30,
          color: AppColors.isDarkSelected
              ? AppColors.darkSecondaryColor
              : AppColors.lightPrimaryColor,
        ),
      ],
    );
  }

  getUnSelectedItem(String theme) {
    return Text(
      theme,
      style: TextStyle(
          color: AppColors.isDarkSelected
              ? AppColors.darkSecondaryColor
              : AppColors.lightPrimaryColor,
          fontSize: 22,
          fontWeight: FontWeight.bold),
    );
  }
}
