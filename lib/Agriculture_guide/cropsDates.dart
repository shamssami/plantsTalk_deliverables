import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:plants_talk/Agriculture_guide/Harversting_Dates.dart';
import 'package:plants_talk/Agriculture_guide/HowToFarm.dart';
import 'package:plants_talk/Agriculture_guide/Planting_Dates.dart';
import 'package:plants_talk/Agriculture_guide/purn.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/Agriculture_guide/purnTips.dart';
import 'package:plants_talk/Agriculture_guide/purnTool.dart';
import 'package:plants_talk/screens/BottomAppBar.dart';

class cropsDates extends StatelessWidget {
  const cropsDates({Key? key}) : super(key: key);
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
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "الزراعة",
                ),
                Tab(
                  text: "الحصاد",
                ),
              ],
            ),
            title: const Text('أوقات زراعة وحصاد المحاصيل'),
            backgroundColor: Colors.green,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TabsDemoScreen()));
                /////////////////////////// to backkk
              },
            ),
          ),
          body: const TabBarView(
            children: [
              Planting_Dates(),
              Harversting_Dates(),
            ],
          ),
        ),
      ),
    );
  }
}
