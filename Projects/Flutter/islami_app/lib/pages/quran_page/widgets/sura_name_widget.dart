import 'package:flutter/material.dart';
import 'package:islami_app/pages/quran_page/models/sura_model.dart';
import 'package:islami_app/pages/quran_page/pages/sura_details.dart';

class SuraNameWidget extends StatelessWidget {
  final SuraModel suraModel;
  const SuraNameWidget({
    super.key,
    required this.suraModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsPage.routeName,
            arguments: SuraModel(
                suraName: suraModel.suraName, index: suraModel.index));
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          suraModel.suraName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
