import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islami_app/utilities/app_colors.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            "اذاعة القرآن الكريم",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 65.0, left: 65, right: 65),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FontAwesomeIcons.backwardFast,
                size: 35,
                color: AppColors.isDarkSelected
                    ? AppColors.darkSecondaryColor
                    : AppColors.lightPrimaryColor,
              ),
              Icon(
                FontAwesomeIcons.play,
                size: 35,
                color: AppColors.isDarkSelected
                    ? AppColors.darkSecondaryColor
                    : AppColors.lightPrimaryColor,
              ),
              Icon(
                FontAwesomeIcons.forwardFast,
                size: 35,
                color: AppColors.isDarkSelected
                    ? AppColors.darkSecondaryColor
                    : AppColors.lightPrimaryColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
