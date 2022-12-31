import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plants_talk/views/pages/plants_monitoring/humidity.dart';
import 'package:plants_talk/views/pages/plants_monitoring/soil_moisture.dart';
import 'package:plants_talk/views/pages/plants_monitoring/tempreature.dart';

import 'package:plants_talk/views/widgets/floatingButton.dart';
import 'package:plants_talk/views/widgets/NavDrawer.dart';

class Monitor extends StatelessWidget {
  const Monitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    void addData() {
      ref
          .child("humidity")
          .child('test')
          .set({'date': '28/05/2022', 'time': '5:45:38', 'value': "79"});
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    const kPrimaryColor = Color(0xFF0C9869);
    const kTextColor = Color(0xFF3C4046);
    const kBackgroundColor = Color(0xFFF9F8FD);

    const double kDefaultPadding = 20.0;
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'EN'), // English, no country code
          // Locale('es', ''), // Spanish, no country code
        ],
        home: Scaffold(
          endDrawer: NavDrawer(),
          appBar: AppBar(
            title: Text('مراقبة النبات'),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 42, 153, 140),
          ),
          backgroundColor: kBackgroundColor,
          body: Container(
            height: 700,
            width: screenWidth,
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 100,
                              // height: screenHeight * 0.8,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.17, left: 6),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: screenWidth * 0.26,
                                          height: screenWidth * 0.26,
                                          decoration: BoxDecoration(
                                              // color: kBackgroundColor,
                                              // color: Color.fromARGB(
                                              //     255, 225, 230, 182),
                                              color: Color.fromARGB(
                                                  255, 190, 226, 173),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: kPrimaryColor,
                                                  blurRadius: 10,
                                                  spreadRadius: 1,
                                                ),
                                              ]),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // addData();
                                            // print(
                                            //     'moisture data ...............................................pppppppppppppp');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Tempreature(),
                                                ));
                                          },
                                          child: SvgPicture.asset(
                                              "assets/icons/sun.svg"),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.04, left: 6),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: screenWidth * 0.26,
                                            height: screenWidth * 0.26,
                                            decoration: BoxDecoration(
                                                // color: kBackgroundColor,

                                                color: Color.fromARGB(
                                                    255, 194, 237, 231),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: kPrimaryColor,
                                                    blurRadius: 10,
                                                    spreadRadius: 1,
                                                  )
                                                ]),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Humidity(),
                                                  ));
                                            },
                                            child: SvgPicture.asset(
                                                "assets/icons/icon_3.svg"),

                                            // SvgPicture.asset(
                                            //     "assets/icons/icon_2.svg"),
                                          )
                                        ],
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.04, left: 6),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: screenWidth * 0.26,
                                          height: screenWidth * 0.26,
                                          decoration: BoxDecoration(
                                              // color: kBackgroundColor,
                                              color: Color.fromARGB(
                                                  255, 238, 223, 185),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: kPrimaryColor,
                                                  blurRadius: 10,
                                                  spreadRadius: 1,
                                                )
                                              ]),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SOilMoisture(),
                                                ));
                                          },
                                          child: Image.asset(
                                            'assets/images/soilMoisture.png',
                                            height: 50,
                                            width: 50,
                                            color:
                                                Color.fromARGB(255, 3, 138, 95),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(),
                          )
                        ],
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/final-try.png"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
