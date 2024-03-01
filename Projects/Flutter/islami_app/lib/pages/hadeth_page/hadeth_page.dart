import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/pages/hadeth_page/models/hadeth_model.dart';
import 'package:islami_app/pages/hadeth_page/widgets/hadeth_name_widget.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:islami_app/utilities/app_theme.dart';

class HadethPage extends StatefulWidget {
  const HadethPage({super.key});

  @override
  State<HadethPage> createState() => _HadethPageState();
}

class _HadethPageState extends State<HadethPage> {
  static List<HadethModel> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      readFileDetails();
    }
    return ahadeth.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/hadeth_logo.png",
                scale: 0.9,
              ),
              Divider(
                thickness: 3,
                color: AppColors.isDarkSelected
                    ? AppColors.darkSecondaryColor
                    : AppColors.lightPrimaryColor,
              ),
              Center(
                child: Text("احاديث",
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Divider(
                thickness: 3,
                color: AppColors.isDarkSelected
                    ? AppColors.darkSecondaryColor
                    : AppColors.lightPrimaryColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HadethNameWidget(hadethModel: ahadeth[index]),
                  ),
                  itemCount: ahadeth.length,
                ),
              ),
            ],
          );
  }

// reading file from text file that contains hadeth
  void readFileDetails() async {
    // but th file content inside the for loop to check the no of hadeth text file that read
    for (int i = 0; i < 50; i++) {
      String fileContent =
          await rootBundle.loadString("assets/quran/hadeth/h${i + 1}.txt");
      List<String> hadethLines = fileContent.trim().split("\n");

      String hadethTitle = hadethLines[0].trim();
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join("\n");
      HadethModel hadethModel =
          HadethModel(hadethName: hadethTitle, hadethContent: hadethContent);
      ahadeth.add(hadethModel);
    }
    setState(
      () {},
    );
  }
}
