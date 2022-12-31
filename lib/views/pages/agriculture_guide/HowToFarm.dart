import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/views/pages/agriculture_guide/Planting_Dates.dart';

class HowToFarm extends StatelessWidget {
  const HowToFarm({Key? key}) : super(key: key);

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
                  child: Image.asset(
                'assets/images/Step11.png',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/Step2.jpg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/Step3.jpg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/Step44.jpg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 10),
              Container(child: Image.asset('assets/images/Step5.png')),
              SizedBox(height: 10),
              Container(
                  child: Image.asset(
                'assets/images/Step6.jpg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/Step7.png',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/Step8.jpg',
                fit: BoxFit.contain,
              )),
            ],
          ),
        )));
  }
}
