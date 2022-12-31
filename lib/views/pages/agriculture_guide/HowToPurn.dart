import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:plants_talk/views/pages/agriculture_guide/HowToFarm.dart';
import 'package:plants_talk/views/pages/agriculture_guide/purn.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/views/pages/agriculture_guide/purnTips.dart';
import 'package:plants_talk/views/pages/agriculture_guide/purnTool.dart';

class HowToPurn extends StatelessWidget {
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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.teal.shade100,
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "كيفية التقليم",
                ),
                Tab(
                  text: "الادوات",
                ),
                Tab(
                  text: "تحذيرات",
                ),
              ],
            ),
            title: const Text('كيفية التقليم'),
            centerTitle: true,
            backgroundColor: Colors.teal.shade700,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: const TabBarView(
            children: [
              purn(),
              purnTool(),
              purnTips(),
            ],
          ),
        ),
      ),
    );
  }
}
