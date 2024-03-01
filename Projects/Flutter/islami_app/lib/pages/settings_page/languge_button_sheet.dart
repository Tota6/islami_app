import 'package:flutter/material.dart';
import 'package:islami_app/utilities/app_colors.dart';

class LangugeButtomSheet extends StatelessWidget {
  const LangugeButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSelectedItem(),
          const SizedBox(
            height: 30,
          ),
          getUnSelectedItem(),
        ],
      ),
    );
  }

  getSelectedItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "English",
          style: TextStyle(
              color: AppColors.lightPrimaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        const Icon(
          Icons.check,
          size: 30,
        ),
      ],
    );
  }

  getUnSelectedItem() {
    return Text(
      "Arabic",
      style: TextStyle(
          color: AppColors.lightPrimaryColor,
          fontSize: 22,
          fontWeight: FontWeight.bold),
    );
  }
}
