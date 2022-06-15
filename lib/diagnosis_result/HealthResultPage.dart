import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/conditions.dart';
import '../widgets/symptoms.dart';
import '../widgets/treatment.dart';

class HealthyResult extends StatelessWidget {
  final List<String> images = [
    'assets/health.png',
    'assets/health2.jpg',
    'assets/health3.jpg'
  ];
  final String imagePath;
  HealthyResult(this.imagePath);

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
                              Image.network(
                                imagePath,
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                                // headers: ,
                              )
                              // Photo from https://unsplash.com/photos/_-JR5TxKNSo
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
                              'نباتك صحي',
                              style: new TextStyle(
                                fontFamily: "VT323",
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                // color: white
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'عمل رائع، استمر بعنايته!',
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    //  color: white
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: new Image.asset(
                                    'assets/icons/celebrate.png',
                                    height: 40.0,
                                    // fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
                AppBar(
                    iconTheme: IconThemeData(color: Colors.white),
                    backgroundColor: Colors.transparent,
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'أهم خدمات التطبيق للحفاظ على صحة محصولك',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        CareTips()
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

////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////

class CareTips extends StatefulWidget {
  @override
  CareTipsState createState() => CareTipsState();
}

class CareTipsState extends State<CareTips> {
  // final String envConditions;
  // Card2(this.envConditions);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: EdgeInsets.all(10),
        // child: Card(

        //   clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Image(
                        height: 58,
                        width: 50,
                        image: AssetImage('assets/images/guide-icon.png'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "اتبع تعليمات الدليل الزراعي",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ])),
                collapsed: Text(
                  'اتبع النصائح التي يوفرها الدليل الزراعي بالمواضيع المتعلقة بالزراعة والحصاد والتقليم، و المواعيد المناسبة للمحاصيل.',
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'اتبع النصائح التي يوفرها الدليل الزراعي بالمواضيع المتعلقة بالزراعة والحصاد والتقليم، و المواعيد المناسبة للمحاصيل.',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(children: [
                      Image(
                        height: 48,
                        width: 40,
                        image: AssetImage(
                          'assets/images/analytics.png',
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          child: Text(
                        'مراقبة بيانات نباتك في الوقت الفعلي',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ))
                    ])),
                collapsed: Text(
                  'من خلال دمج التطبيق باجهزة الاردوينو، يمكنك معرفة حاجة النباتات وحالته الصحية من خلال قراءة البيانات القادمة بواسطة اجهزة الاردوينو، والتي ترسل الاشعارات عندما تكون القراءات ليست بالمعدل الطبيعي.',
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'من خلال دمج التطبيق باجهزة الاردوينو، يمكنك معرفة حاجة النباتات وحالته الصحية من خلال قراءة البيانات القادمة بواسطة اجهزة الاردوينو، والتي ترسل الاشعارات عندما تكون القراءات ليست بالمعدل الطبيعي.',
                    ),
                    // Container(
                    //   child: Image.asset(
                    //     'assets/images/monitorSensors.png',
                    //     // height: 150.0,
                    //     // fit: BoxFit.cover,
                    //   ),
                    // )
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      const Image(
                        height: 58,
                        width: 50,
                        image: AssetImage('assets/images/network-icon.png'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          child: Text(
                        'تفاعل مع مجتمعنا الزراعي',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ))
                    ])),
                collapsed: Text(
                  'بانضمامك لمجتمع التطبيق الزراعي، يمكنك مشاركة افكارك وخبراتك مع الاخرين على الشبكة الاجتماعية، كما يمكنك الاستفادة من خبرات وتجارب خبراء زراعيين في هذا المجتمع. استفسر وناقش قضايا تزعجك في محصولك الزراعي.',
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'بانضمامك لمجتمع التطبيق الزراعي، يمكنك مشاركة افكارك وخبراتك مع الاخرين على الشبكة الاجتماعية، كما يمكنك الاستفادة من خبرات وتجارب خبراء زراعيين في هذا المجتمع. استفسر وناقش قضايا تزعجك في محصولك الزراعي.',
                    ),
                    // Container(
                    //   child: Image.asset(
                    //     'assets/images/network-icon.png',
                    //     // height: 150.0,
                    //     // fit: BoxFit.cover,
                    //   ),
                    // )
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}