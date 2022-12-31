import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../widgets/conditions.dart';
import '../../widgets/symptoms.dart';
import '../../widgets/treatment.dart';

class Diagnosis extends StatelessWidget {
  final List<String> leafSymptoms;
  final List<String> fruitSymptoms;
  final List<String> listConditions;
  final List<String> listChemicals;
  final List<String> images;
  final String title;
  final String imagePath;
  final String caption;

  // Function(String) networkImage;
  // final Function(String) fileImage;

  Diagnosis(
    this.leafSymptoms,
    this.fruitSymptoms,
    this.listConditions,
    this.listChemicals,
    this.images,
    this.title,
    this.imagePath,
    this.caption,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', 'AE'), // English, no country code
          // Locale('es', ''), // Spanish, no country code
        ],
        home: Scaffold(
            body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                    height: 300.0,
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: '$this.title',
                          child: Carousel(
                            images: [
                              AssetImage(this.images[0]),
                              AssetImage(this.images[1]),
                              AssetImage(this.images[2]),
                              FileImage(File(imagePath)),
                            ],
                            dotSize: 4.0,
                            dotSpacing: 15.0,
                            autoplay: true,
                            dotColor: Colors.white,
                            indicatorBgPadding: 50.0,
                            dotBgColor: Colors.transparent,
                            borderRadius: false,
                            moveIndicatorFromBottom: 200.0,
                            noRadiusForIndicator: true,
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 270, left: 20, right: 20),
                  child: Container(
                      height: 100.0,
                      width: MediaQuery.of(context).size.width - 24.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.0,
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2.0)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              this.title,
                              style: new TextStyle(
                                fontFamily: "VT323",
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                // color: white
                              ),
                            ),
                            Text(
                              this.caption,
                              style: new TextStyle(
                                fontSize: 15.0,
                                //  color: white
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                AppBar(
                    iconTheme: IconThemeData(color: Colors.white),
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                    elevation: 0,
                    actions: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]),
                Container(
                    // height: MediaQuery.of(context).size.height * 2.3,
                    child: Padding(
                  padding: EdgeInsets.only(
                      top: 390, bottom: 20, left: 14, right: 14),
                  child: ExpandableTheme(
                    data: const ExpandableThemeData(
                      iconColor: Color.fromARGB(255, 38, 147, 92),
                      useInkWell: true,
                    ),
                    child: Column(
                      children: <Widget>[
                        Symptoms(fruitSymptoms, leafSymptoms),
                        Conditions(listConditions: listConditions),
                        Treatment(listChemicals)
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ],
        )));
  }

  Widget amenities(
    String url1,
    String url2,
    String url3,
    String features1,
    String features2,
    String features3,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url1,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features1)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url2,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features2)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url3,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features3)
              ],
            )),
      ],
    );
  }

  Widget about_hotel(
    String description,
  ) {
    return Padding(
        padding: EdgeInsets.only(left: 14, top: 6, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              description,
              style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ],
        ));
  }
}

ShowImage(String path) {
  try {
    print('/////////////////////////////////pathhh');
    print(path);

    Image.network(
      path,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      // headers: ,
    );

    print('try solveeeeeeeeeeeeeeeeeeeeeeeee');
  } catch (e) {
    print(path);
    print('/////////////////////////////////pathhh');
    FileImage(File(path));

    print('errrrrrrrrorr catchedddddd');
  }
}
