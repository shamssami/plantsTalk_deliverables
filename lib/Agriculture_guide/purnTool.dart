import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/Agriculture_guide/Planting_Dates.dart';

class purnTool extends StatelessWidget {
  const purnTool({Key? key}) : super(key: key);

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
                  child: Text(
                'الأدوات التي سنحتاج لها هي:',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 20),
              Container(
                child: Text(
                  '•	مقص يد (للأغصان الصغيرة والرفيعة).',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/tool1.jpg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '•	مقصات عقدة. ',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/tool22.jpg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '•	منشار يد. ',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/tool4.jpeg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  ' •	منشار قطبي بعصا (للأفرع التي يصعب الوصول إليها).',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/tool3.jpeg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  ' •	سلم – اذا لَزِمَ',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/tool5.jpg',
                fit: BoxFit.contain,
              )),
            ],
          ),
        )));
  }
}
