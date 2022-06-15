import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Warning extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<Warning> {
  @override
  Widget build(BuildContext context) => MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('ar', 'AE'), // English, no country code
            // Locale('es', ''), // Spanish, no country code
          ],
          title: "route",
          home: Scaffold(
            appBar: AppBar(
              title: Text('تحذيرات زراعية'),
              backgroundColor: Colors.teal.shade800,
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
            body: ListView(
              padding: EdgeInsets.all(16),
              children: [
                war1(),
                war2(),
                war3(),
                war4(),
                war5(),
                war6(),
                war7(),
                war8(),
              ],
            ),
          ));

  Widget war1() => Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Text(
                    "ري المزروعات 3 مرات يوميا في فصل الصيف تتوزع على مدار اليوم، وفي فصل الشتاء يفضل ري المزروعات كل يومين مرة واحدة",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    textAlign: TextAlign.right,
                  )),
                ],
              ),
            ],
          ),
        ),
      );
  Widget war2() => Card(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                      'زيادة الري في التربة يؤدي إلى التقليل من تهوية التربة وبالتالي التقليل من امتصاص الجذور للماء والعناصر الغذائية.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget war3() => Card(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                      'الرى الغزير يؤدي إلى ظهور أعراض على النباتات تشبه أعراض نقص مياه الري.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget war4() => Card(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                      'التقليم غير الصحيح يؤدي في معظم الأحيان الى ترك الشجرة من دون ثمار، وبالتالي فإن خيار عدم التقليم يبقى أقل ضرراً من التقليم الخاطئ.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget war5() => Card(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                      'استخدام كثير من الأسمدة سوف يطغى على النباتات ويصيبها بالأمراض والجفاف.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget war6() => Card(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                      'لا شك أن النباتات تحتاج ضوء الشمس لتتمكن من النمو بشكل كبير وقوي، ولكن تعريض النباتات لأشعة الشمس بشكل مباشر قد يصيبها بالحروق.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget war7() => Card(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                      'تغيير مكان النباتات بشكل متكرر قد يضر بها على المدى الطويل.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget war8() => Card(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                      'استخدام السماد عندما يكون النبات في موسم نمو، وليس عندما يكون النبات خاملاً.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
