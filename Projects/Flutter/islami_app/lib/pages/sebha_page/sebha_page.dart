import 'package:flutter/material.dart';

class SebhaPage extends StatefulWidget {
  const SebhaPage({super.key});

  @override
  State<SebhaPage> createState() => _SebhaPageState();
}

class _SebhaPageState extends State<SebhaPage> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> tasbehatList = [
    "سبحان الله",
    "الحمدالله",
    "الله اكبر",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.086),
                  child: Transform.rotate(
                      angle: angle,
                      child: Image.asset("assets/images/body_sebha_logo.png")),
                ),
                Image.asset("assets/images/head_sebha_logo.png"),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "عدد التسبيحات",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffCAB597)),
              child: Text(
                counter.toString(),
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              tasbeh();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xffB7935F)),
                child: Text(
                  tasbehatList[index],
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void tasbeh() {
    if (index < 2) {
      if (counter < 33) {
        angle += 0.5;
        counter++;
      } else {
        index++;
        tasbehatList[index];
        counter = 0;
      }
    } else {
      index = 0;
      counter = 0;
    }
  }
}
