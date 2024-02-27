import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/pages/hadeth_page/models/hadeth_model.dart';
import 'package:islami_app/pages/hadeth_page/widgets/hadeth_name_widget.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset("assets/images/hadeth_logo.png"),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    width: double.infinity,
                    height: 2,
                    color: const Color(0xffB7935F),
                  ),
                  itemBuilder: (context, index) =>
                      HadethNameWidget(hadethModel: ahadeth[index]),
                  itemCount: ahadeth.length,
                ),
              ),
            ],
          );
  }

  void readFileDetails() async {
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
