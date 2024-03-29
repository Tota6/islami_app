import 'package:flutter/material.dart';
import 'package:islami_app/pages/quran_page/models/sura_model.dart';
import 'package:islami_app/pages/quran_page/widgets/sura_name_widget.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:provider/provider.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  static const List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return suraName.isEmpty
        ? const CircularProgressIndicator()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset("assets/images/qur2an_screen_logo.png"),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    width: double.infinity,
                    height: 2,
                    color: provider.currentTheme == ThemeMode.light
                        ? AppColors.lightPrimaryColor
                        : AppColors.darkSecondaryColor,
                  ),
                  itemBuilder: (context, index) => SuraNameWidget(
                    suraModel: SuraModel(
                      suraName: suraName[index],
                      index: index,
                    ),
                  ),
                  itemCount: suraName.length,
                ),
              ),
            ],
          );
  }
}
