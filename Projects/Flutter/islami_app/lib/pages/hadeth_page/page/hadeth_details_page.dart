import 'package:flutter/material.dart';
import 'package:islami_app/pages/hadeth_page/models/hadeth_model.dart';

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
                    margin: const EdgeInsets.symmetric(horizontal: 70),
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
                            arg.hadethName,
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
                          arg.hadethContent,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
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
