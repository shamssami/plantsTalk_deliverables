import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:plants_talk/views/pages/agriculture_guide/FarmOut.dart';
import 'package:plants_talk/views/pages/agriculture_guide/HowToFarm.dart';
import 'package:plants_talk/views/pages/agriculture_guide/purn.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/views/pages/agriculture_guide/purnTips.dart';
import 'package:plants_talk/views/pages/agriculture_guide/purnTool.dart';

class Farm extends StatelessWidget {
  const Farm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Home Farming",
                ),
                Tab(
                  text: "Farming Outside Home",
                ),
              ],
            ),
            title: const Text('How To Farm'),
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
              HowToFarm(),
              FarmOut(),
            ],
          ),
        ),
      ),
    );
  }
}
