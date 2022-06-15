// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plants_talk/diagnosis_result/DesignResultPage.dart';

import 'package:plants_talk/screens/Profile.dart';
import 'package:plants_talk/screens/disease_detection/carousel_loading.dart';
import 'package:plants_talk/screens/disease_detection/planthelath.dart';
import 'package:plants_talk/screens/real_time_monitoring/monitor.dart';
import 'package:plants_talk/screens/real_time_monitoring/notification.dart';
import 'package:plants_talk/utils/empty_card.dart';

import 'package:plants_talk/screens/disease_detection/history.dart';
import 'package:plants_talk/services/disease-diagnosis.dart';
import 'package:plants_talk/utils/floatingButton.dart';
import 'package:plants_talk/utils/itemCard.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../services/result.dart';

class MainPage extends StatefulWidget {
  @override
  final String uid;
  const MainPage({Key? key, required this.uid}) : super(key: key);
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
//////////// Retrieve sensors data from real time database//////////////
  String humidity = '1';
  String temp = '2';
  String moisture = '3';
  // final database = FirebaseDatabase.instance.reference();
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  List diseaseList = [];
  fetchDatabaseList() async {
    dynamic results =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getDiseasesList();
    if (results == null) {
      print(diseaseList.length);
      print('Unable to retrieve ...................');
    } else {
      setState(() {
        diseaseList = results;
      });
    }
  }

  bool loading = false;

  String _lastSelected = "TAB: 0";

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = "TAB: $index";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 42, 153, 140),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Profile(FirebaseAuth.instance.currentUser!.uid, 0)));
          },
          icon: Icon(Icons.person),
          color: Colors.white,
        ),
        // backgroundColor: Colors.transparent,
        elevation: 0.0,
        // title: const Text('بلانتس توك',
        //     style: TextStyle(
        //       fontFamily: 'Montserrat',
        //       fontSize: 18.0,
        //       color: Colors.white,
        //     ),
        //     textAlign: TextAlign.left),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                CarouselSlider(
                  items: imgList
                      .map((item) => Container(
                            child: Center(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                                width: 1000,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'السجل',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(131, 53, 54, 54),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => History()));
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                      color: Colors.black,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                diseaseList.isEmpty
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 6.0),
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: 800,
                        child: Container(
                          // alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          // width: MediaQuery.of(context).size.width * 0.3,
                          child: Row(
                            children: [SecondImage(context), EmptyCard()],
                          ),
                        ))
                    : Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 6.0),
                        height: MediaQuery.of(context).size.height * 0.33,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: diseaseList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: cardPlant(
                                  context,
                                  diseaseList[index]['name'],
                                  diseaseList[index]['image'],
                                ),
                              );
                            }),
                      ), /////////////////////

                const SizedBox(
                  height: 40,
                ),

                const SizedBox(
                  height: 50,
                ),

                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButtonAnimated(),
    );
  }

  Widget _starter(String image, String name) {
    return Container(
      height: 170,
      width: 160,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Text(
              '20min Starter',
              style: TextStyle(
                color: Color(0xffb6b6b6),
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(name),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff3dab85)),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

///////History Widget///////////////////////////////
  ///
  Widget _history() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: ItemCard(title: 'Tomato', photo: 'assets/scab2.jpg'),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {},
            child: ItemCard(title: 'Tomato', photo: 'assets/tomato1.png'),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {},
            child: ItemCard(
              title: 'Tomato',
              photo: 'assets/tomato1.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget _returnHistoryContainer(
      List diseaseList, BuildContext context, int index, Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
      child: GestureDetector(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5.0, left: 10, right: 10, bottom: 10),
          child: Container(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ItemCard(
                    title: '${diseaseList[index]['name']}',
                    photo: '${diseaseList[index]['image']}',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget SecondImage(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(spacing: 10.0, children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.28,
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                onTap: () => print("Add Story Clicked"),
                child: Column(
                  children: [
                    Container(
                      height: 165,
                      width: 160,
                      // margin: EdgeInsets.only(bottom: 30.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image(
                          opacity: AlwaysStoppedAnimation<double>(0.9),
                          image: AssetImage('assets/images/addImage.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: Text(
                        'مرض النبات',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    ),
  );
}

Widget cardPlant(BuildContext context, String title, String photo) {
  return Container(
    margin: EdgeInsets.all(10.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(spacing: 10.0, children: [
        Container(
          height: 220,
          width: 160,
          decoration: BoxDecoration(
              color: Color(0xFF0E3311).withOpacity(0.1),
              // border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 42, 153, 140).withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                onTap: () {
                  ResultPage().resultPage(context, title, photo);
                },
                child: Column(
                  children: [
                    Container(
                      height: 218,
                      width: 160,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image(
                          image: NetworkImage(
                            photo,
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ]),
    ),
  );
}
