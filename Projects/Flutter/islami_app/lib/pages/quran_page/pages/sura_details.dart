import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/pages/quran_page/models/sura_model.dart';

class SuraDetailsPage extends StatefulWidget {
  static String routeName = "SuraDetailsPage  ";

  const SuraDetailsPage({super.key});

  @override
  State<SuraDetailsPage> createState() => _SuraDetailsPageState();
}

class _SuraDetailsPageState extends State<SuraDetailsPage> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraModel arg = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      readFileDetails(arg.index);
    }
    return verses.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              Image.asset(
                "assets/images/default_bg.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Scaffold(
                appBar: AppBar(
                  title: const Text("اسلامى"),
                ),
                body: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Card(
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
                          margin: const EdgeInsets.symmetric(horizontal: 100),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
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
                                  arg.suraName,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(Icons.play_circle)
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
                                verses[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            itemCount: verses.length,
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

  void readFileDetails(int index) async {
    String fileContent =
        await rootBundle.loadString("assets/assets/${index + 1}.txt");
    List<String> suraLines = fileContent.split("/n");
    verses = suraLines;
    for (int i = 0; i <= suraLines.length; i++) {
      setState(
        () {},
      );
    }
  }
}
