import 'package:flutter/material.dart';
import 'package:plants_talk/views/widgets/GWidgets.dart';

List<String> getStartedPageImages = [
  "assets/images/gett1.jpg",
  "assets/images/gett2.jpg",
  "assets/images/gettt3.jpg",
  "assets/images/get3.jpg",
];

List heading = <String>[
  "تشخيص النباتات",
  "دليل ارشادي زراعي",
  "صفحة تفاعلية",
  "دمج اجهزة استشعار للنباتات",
];

List subHeading = <String>[
  "تشخيص مرضك من خلال صورته.",
  "دليل زراعي كامل عن دورة حياة النباتات",
  "صفحة تفاعلية تضم المستخدمين للتفاعل معًا",
  "امكانية دمج مستشعرات المصنع ومراقبة معلوماتها من خلال التطبيق",
];

final ValueNotifier<double> currentPage = ValueNotifier<double>(0.0);

PageController myPageViewController = new PageController(viewportFraction: 0.8);

Widget buildPageView(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height / 1.55,
      child: Container(
        child: PageView.builder(
          controller: myPageViewController,
          itemCount: 4,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return buildTopViews(context, index);
          },
          onPageChanged: (value) {
            try {
              currentPage.value = value.toDouble();
            } catch (e) {}
          },
        ),
      ),
    );

Widget buildTopViews(BuildContext context, int index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.00),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildImage(index),
            heightSpacer(25.00),
            buildTitle(index),
            heightSpacer(10.00),
            buildSubTitle(context, index),
          ],
        ),
      ),
    );

Widget buildImage(int index) => Center(
      child: Container(
        width: double.infinity,
        height: 250,
        child: Image.asset(
          getStartedPageImages[index],
          fit: BoxFit.cover,
        ),
      ),
    );

Widget buildTitle(int index) => Flexible(
      child: Text(
        heading[index],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.00,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

Widget buildSubTitle(BuildContext context, int index) => Flexible(
      child: Container(
        width: (MediaQuery.of(context).size.width) - 100,
        child: Text(
          subHeading[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 12.75,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
