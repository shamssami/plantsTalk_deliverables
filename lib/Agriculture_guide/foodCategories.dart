import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:plants_talk/Agriculture_guide/FarmOut.dart';
import 'package:plants_talk/Agriculture_guide/Grains.dart';
import 'package:plants_talk/Agriculture_guide/Herbs.dart';
import 'package:plants_talk/Agriculture_guide/HowToFarm.dart';
import 'package:plants_talk/Agriculture_guide/Vegetables.dart';
import 'package:plants_talk/Agriculture_guide/purn.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/Agriculture_guide/purnTips.dart';
import 'package:plants_talk/Agriculture_guide/purnTool.dart';
import 'package:plants_talk/Agriculture_guide/Fruits.dart';

class food extends StatelessWidget {
  const food({Key? key}) : super(key: key);

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
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "فواكه",
                ),
                Tab(
                  text: "خضار",
                ),
                Tab(
                  text: "حبوب",
                ),
                Tab(
                  text: "اعشاب",
                ),
              ],
            ),
            title: const Text('مواعيد المحاصيل'),
            backgroundColor: Colors.teal.shade700,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
                //Navigator.push(context, MaterialPageRoute(builder: (context) => TabsDemoScreen()));
                /////////////////////////// to backkk
              },
            ),
          ),
          body: const TabBarView(
            children: [
              Fruits(),
              Vegetables(),
              Grains(),
              Herbs(),
            ],
          ),
        ),
      ),
    );
  }
}
