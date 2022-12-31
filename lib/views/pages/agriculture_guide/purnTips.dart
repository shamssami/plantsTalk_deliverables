import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/views/pages/agriculture_guide/Planting_Dates.dart';

class purnTips extends StatelessWidget {
  const purnTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', 'AE'), // English, no country code
          // Locale('es', ''), // Spanish, no country code
        ],
        title: "route",
        home: Scaffold(
            body: Center(
          child: ListView(
            //  mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                child: Text('  أمور يجب مراعاتها عند التقليم:',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 30),
              Container(
                child: Text(
                  ' •	قلم بطريقة آمنة دومًا. بارتدائك قميص طويل الأكمام وقفازات لحماية يديك ونظارات واقية وآمنة لمنع أية أجسام غريبة من إصابة عينيك',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: Text(
                  ' •	لا تقلم الأشجار الظلية من أعلى. تشذيب أعلى الشجرة هو تقليمها من أجل الارتفاع – وتلك الطريقة تهدف لتطويل الشجرة. لتشذيب الشجرة من أعلى آثار خطيرة على هيكل الفرع وقوته وسلامة الشجرة. لا تحاول التحكم في ارتفاع الشجرة أو ضخامتها من خلال قص القمة. ازرع شجرة مختلفة بدلا عن ذلك',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: Text(
                  ' •	قلم الأشجار الصنوبرية بحذر تام، وخاصة في حالة استخدامك لها كنباتات سياجية (مصدات هوائية أيضًا). فالأشجار الصنوبرية تخرج فقط براعم صغيرت من الخشب الأخضر. لذا، إذا كنت تستخدم الأشجار  الصنوبرية كنبات سياجي، فمن الأفضل تقليم البراعم الخضراء فقط.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        )));
  }
}
