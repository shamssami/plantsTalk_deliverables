import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plants_talk/responsive/mobile_screen_layout.dart';
import 'package:plants_talk/responsive/responsive_layout.dart';
import 'package:plants_talk/views/pages/plants_monitoring/monitor.dart';

import 'package:plants_talk/views/pages/registeration/guidePage.dart';

import 'package:plants_talk/views/pages/disease_detection/main_page.dart';

class TabsDemoScreen extends StatefulWidget {
  TabsDemoScreen() : super();

  @override
  _TabsDemoScreenState createState() => _TabsDemoScreenState();
}

class _TabsDemoScreenState extends State<TabsDemoScreen> {
  int currentTabIndex = 1;
  List<Widget> tabs = [
    guide(),
    MainPage(uid: FirebaseAuth.instance.currentUser!.uid),
    Monitor(),
    ResponsiveLayout(
      mobileScreenLayout: MobileScreenLayout(),
    ),
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color.fromARGB(255, 42, 153, 140),
        selectedItemColor: Colors.black,
        onTap: onTapped,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.seedling), label: "دليل زراعي"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "الصفحة الرئيسية"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor), label: "مراقبة النباتات"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_rounded), label: "الصفحة التفاعلية"),
        ],
      ),
    );
  }
}
