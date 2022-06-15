import 'package:flutter/material.dart';
import 'package:plants_talk/Agriculture_guide/item.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Tips extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<Tips> {
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
              title: Text('نصائح زراعية'),
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
                tip1(),
                SizedBox(height: 20),
                tip2(),
                SizedBox(height: 20),
                tip3(),
                SizedBox(height: 20),
                tip4(),
                SizedBox(height: 20),
                tip5(),
                SizedBox(height: 20),
                tip6(),
                SizedBox(height: 20),
                tip7(),
              ],
            ),
          ));

  Widget tip1() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://www.wikihow.com/images_en/thumb/0/0b/Dry-Mint-Step-1-Version-3.jpg/550px-nowatermark-Dry-Mint-Step-1-Version-3.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'عند قطف النباتات العشبية التي زرعتها كالنعناع، استخدم أداة حادة ولا تقطفها فقط بيديك لتحافظ على استمرار نموها.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      );

  //2
  Widget tip2() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://shlooon.com/wp-content/uploads/garedn-roses-1200x900.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'قم بقص الأجزاء الميتة من النبات كالزهور أو أطراف الأوراق لتشجيع نمو الأجزاء الأخرى الصحية من النبات',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      );

  //tip3
  Widget tip3() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://1.bp.blogspot.com/-qnsI_ANeYH4/YAoQkobDB5I/AAAAAAAAAoo/sErR1orAYCg5F-629xfbrTfXJPL7Yb8TQCLcBGAsYHQ/s297/%25D8%25AA%25D9%2586%25D8%25B2%25D9%258A%25D9%2584.jpeg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'ينصح مزارعو البيوت المحمية في الاغوار بتهوية البيوت ظهرا حتى لا ترتفع الحرارة والرطوبة داخلها.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      );

  //tip4
  Widget tip4() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://garden-fr.desigusxpro.com/wp-content/uploads/2018/08/kak-letom-polivat-yabloni_1.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'عند انقطاع الأمطار في فصل الشتاء ينصح بري الأشجار المثمرة مرة واحدة شهرا.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      );
  //tip5
  Widget tip5() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://img.bestdealplus.com/ae04/kf/H8cce6b5f83ce48478d76399b1ffdb994p.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'احفر متراً ونصف على أقل تقدير عندما تزرع شجرتك.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      );
  //tip6
  Widget tip6() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://i0.wp.com/2qlam.com/wp-content/uploads/2021/02/%D8%B7%D8%B1%D9%82-%D8%B1%D9%8A-%D8%A7%D9%84%D9%86%D8%A8%D8%A7%D8%AA%D8%A7%D8%AA.jpg?fit=1200%2C892&ssl=1',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'اسقي شجرتك بانتظام وبدون اسراف طيلة الأشهر السبعة الأولى من عمرها لتحفيز نمو الجذر الرئيسي أفقياً تبعاً للماء وقطع الطريق أمام نشوء جذور فرعية الانتشار.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      );
  //tip7
  Widget tip7() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://new.almalomat.com/wp-content/uploads/2020/01/%D8%AE%D9%88%D8%A7%D8%B7%D8%B1-%D8%B9%D9%86-%D8%A7%D9%84%D8%B4%D8%AC%D8%B1-%D9%85%D9%86-%D8%A7%D9%84%D9%81%D9%84%D8%A7%D8%B3%D9%81%D8%A9-601x400.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                ' اجعل شجرتك تعطش ابتداء من الشهر الثامن وباعد بين السقايات لتشجيع الجذور على البحث عميقاً عن الرطوبة المستخلصة من التربة.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      );
}
