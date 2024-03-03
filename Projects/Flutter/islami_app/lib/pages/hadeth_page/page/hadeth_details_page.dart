import 'package:flutter/material.dart';
import 'package:islami_app/pages/hadeth_page/models/hadeth_model.dart';

import '../../../utilities/app_colors.dart';

class HadethDetailsPage extends StatefulWidget {
  static String routeName = "HadethDetailsPage";
  const HadethDetailsPage({super.key});

  @override
  State<HadethDetailsPage> createState() => _HadethDetailsPageState();
}

class _HadethDetailsPageState extends State<HadethDetailsPage> {
  @override
  Widget build(BuildContext context) {
    HadethModel arg = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Stack(
      children: [
        Image.asset(
          AppColors.isDarkSelected
              ? "assets/images/dark_bg.png"
              : "assets/images/default_bg.png",
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
                  color: AppColors.isDarkSelected
                      ? AppColors.whiteColor
                      : AppColors.lightTextColor),
            ),
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Card(
              color: AppColors.isDarkSelected
                  ? AppColors.darkNavBarColor
                  : AppColors.whiteColor,
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
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.isDarkSelected
                              ? AppColors.darkSecondaryColor
                              : AppColors.lightPrimaryColor,
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
                            arg.hadethName,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
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
                          arg.hadethContent,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      itemCount: 1,
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
}
