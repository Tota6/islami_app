import 'package:flutter/material.dart';
import 'package:islami_app/pages/hadeth_page/models/hadeth_model.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<SettingProvider>(context);
    return Stack(
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
                    margin: const EdgeInsets.symmetric(horizontal: 20),
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
