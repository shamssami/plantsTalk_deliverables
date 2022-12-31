import 'package:flutter/material.dart';
import 'package:plants_talk/views/pages/agriculture_guide/Farm.dart';
import 'package:plants_talk/views/pages/agriculture_guide/FarmOut.dart';
import 'package:plants_talk/views/pages/agriculture_guide/HowToPurn.dart';
import 'package:plants_talk/views/pages/agriculture_guide/Pests.dart';
import 'package:plants_talk/views/pages/agriculture_guide/foodCategories.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/views/pages/agriculture_guide/Fruits.dart';
import 'package:plants_talk/views/pages/agriculture_guide/warning.dart';
import 'package:plants_talk/views/pages/agriculture_guide/Tips.dart';

class guide extends StatefulWidget {
  const guide({Key? key}) : super(key: key);

  @override
  _MakeDashboardItemsState createState() => _MakeDashboardItemsState();
}

class _MakeDashboardItemsState extends State<guide> {
  Card makeDashboardItem(String title, String img, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: index == 0 || index == 3 || index == 4
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(3.0, -1.0),
                  colors: [
                    Color(0xFF00897B),
                    Color(0xFF26A69A),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                  )
                ],
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(3.0, -1.0),
                  colors: [
                    Colors.cyan,
                    Colors.amber,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                  )
                ],
              ),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FarmOut()));
            }
            if (index == 1) {
              //2.item
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HowToPurn()));
            }
            if (index == 2) {
              //3.item
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => food()));
            }
            if (index == 3) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Pests()));
            }
            if (index == 4) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Tips()));
            }
            if (index == 5) {
              //6.item

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Warning()));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  img,
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

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
          //
          appBar: AppBar(
            title: const Text('الدليل الزراعي'),
            backgroundColor: Colors.teal.shade700,
            centerTitle: true,
          ),

          // backgroundColor: Colors.teal.shade100,
          body: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        SizedBox(height: 4),

                        // Icon(
                        //   Icons.arrow_back,
                        //   color: Colors.white,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(2),
                  children: [
                    makeDashboardItem(
                        "كيفية الزراعة", "assets/images/shovels.png", 0),
                    makeDashboardItem("كيفية التقليم",
                        "assets/images/construction-and-tools.png", 1),
                    makeDashboardItem(
                        "مواعيد المحاصيل", "assets/images/calendar.png", 2),
                    makeDashboardItem(
                        "الحشرات الزراعية", "assets/images/ladybug.png", 3),
                    makeDashboardItem(
                        "نصائح زراعية", "assets/images/advice.png", 4),
                    makeDashboardItem(
                        "تحذيرات زراعية", "assets/images/alert.png", 5),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
