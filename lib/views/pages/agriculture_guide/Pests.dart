import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/views/pages/agriculture_guide/pest.dart';
import 'package:readmore/readmore.dart';

class Pests extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<Pests> {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
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
          title: Text('الحشرات الزراعية'),
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
            Aphid(),
            SizedBox(height: 20),
            Potato_beetle(),
            SizedBox(height: 20),
            old_needle(),
            SizedBox(height: 20),
            locusts(),
            SizedBox(height: 20),
            Japanese_ladybug(),
            SizedBox(height: 20),
            night_crickets(),
            SizedBox(height: 20),
          ],
        ),
      ));

  Widget Aphid() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://mqaall.com/wp-content/uploads/2020/06/%D8%A7%D8%B6%D8%B1%D8%A7%D8%B1-%D8%AD%D8%B4%D8%B1%D8%A9-%D8%A7%D9%84%D9%85%D9%86-%D8%B9%D9%84%D9%89-%D8%A7%D9%84%D8%A7%D9%86%D8%B3%D8%A7%D9%86.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'المن',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Container(
                padding: EdgeInsets.all(15),
                child: ReadMoreText(
                  "يتغذى المن على الخضار والفواكه ، وينقل الأمراض إلى النبات ، مما يؤدي إلى توقف نمو النبات ؛ كما أنه مستوطن في الجزء السفلي من أوراق النبات. ومن طرق مكافحة المن: 1) قطع الأوراق المصابة. ) رش النبات بمحلول من لتر واحد من الماء وقطرات من الصابون وملعقة كبيرة من زيت الكانولا. 3) توجيه المياه ذات الضغط العالي نحو أوراق النبات.",
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "المزيد",
                  trimExpandedText: " ",
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      );

  //card2
  Widget Potato_beetle() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://p0.pikist.com/photos/716/858/beetle-potato-beetle-insect-pest-beautiful-probe-colorful-feet-head.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'خنفساء البطاطس',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Container(
                padding: EdgeInsets.all(15),
                child: ReadMoreText(
                  "المعروف أيضًا باسم كولورادو ، وهو من أخطر أنواع الآفات الزراعية على المحاصيل ، حيث يمكن أن يدمر محصولًا كاملاً ؛ هذه الحشرة تصيب محاصيل مختلفة ، مثل: الطماطم والفلفل والباذنجان. ومن بين طرق مكافحة خنفساء البطاطس : 1) رج النبات للتخلص من الحشرات الموجودة عليه بخرقة .2) استخدام المستحضرات الحيوية التي لا تؤثر على ثمار النبات .3) يمكن استخدام المبيدات الحشرية في حالة زيادة أعداد الحشرات. 4) استخدام المصائد الصفراء اللاصقة للسيطرة على انتشار هذه الحشرة. ",
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "المزيد",
                  trimExpandedText: " ",
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      );
  //card3
  Widget old_needle() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://ziehen-nord-problem.com/mmej/s-kANOQT2kHR9vzxroxuGAAAAA.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'ابرة قديمة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Container(
                padding: EdgeInsets.all(15),
                child: ReadMoreText(
                  "سميت أيضا باسم أبو مقس ؛ لأن ذيلها يشبه المقص ، ولونها أسود وصغير الحجم ، كما أنها تعيش على المادة العضوية في التربة وتتغذى أيضًا على الأنسجة النباتية والزهور والفاكهة ، مما يتسبب في تشويه النبات ، كما أنه وسيط في نقل بعض الأمراض نتيجة تطفله على الثدييات مثل الخفافيش والفئران ، وعلى الرغم من أنه يضر بالنبات إلا أنه يفيد في القضاء على بعض الحشرات مثل: المن ، والتفاح. عث الفاكهة: ومن طرق منع الإبرة القديمة: 1) عمل مصيدة للحشرة ، وذلك بوضع علبة من الصفيح ثم ملؤها بالزيت النباتي ، حيث يجذب الزيت الحشرة فتزحف إليها وتغرق فيها. 2) استخدام الحيوانات المفترسة الطبيعية مثل الطيور والضفادع التي تتغذى على المقص .3) تستخدم المبيدات الحشرية للتحكم في الإبرة القديمة ورشها في الخلف ؛ حيث تظل سارية المفعول حتى المساء وقت خروج الحشرة.",
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "المزيد",
                  trimExpandedText: " ",
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      );
  //card4
  Widget locusts() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://i0.wp.com/faharas.net/wp-content/uploads/2021/08/Locust.jpg?resize=1170%2C671&ssl=1',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'الجراد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Container(
                padding: EdgeInsets.all(15),
                child: ReadMoreText(
                  "في الواقع ، يعتبر الجراد من أخطر أنواع الآفات الزراعية على النباتات ، على الرغم من أنه الغذاء المفضل للطيور ، إلا أنه يمتلك القدرة على تدمير النباتات. ومن طرق مكافحة الجراد: 1) للدجاج القدرة على مكافحة الجراد. الجراد ، لأنهم يفضلون أكل كمية كبيرة من الجراد والحشرات الأخرى. 2) استخدام الصابون المبيد للحشرات أو رذاذ الفلفل الحار أو رذاذ الثوم لمكافحة الجراد. 3) الاستخدام المبكر للمبيدات الحشرية يساعد في مكافحة الجراد.",
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "المزيد ",
                  trimExpandedText: " ",
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      );
  //card5
  Widget Japanese_ladybug() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://media.istockphoto.com/photos/an-adult-asian-ladybeetle-picture-id1097051960?k=20&m=1097051960&s=612x612&w=0&h=t62p2Xlfi_-MYP8S8Kt8xbVM6zRaZrysmjUlxRl4fVQ=',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'الخنفساء اليابانية',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Container(
                padding: EdgeInsets.all(15),
                child: ReadMoreText(
                  "تعيش اليرقات في التربة ، وتتغذى على جذور الأعشاب والنباتات ، بينما تتغذى الخنفساء البالغة على الأوراق والأزهار. وغالبًا ما يكون استخدام المنتجات للقضاء على الخنفساء اليابانية دون معرفة دورة حياتها ومتى تستخدمها مضيعة للوقت والمال.من المهم معرفة متى تكون نشطة للسيطرة عليها بشكل جيد ، ولكن يمكن القضاء عليها عن طريق المكافحة البيولوجية: تعالج مناطق العشب بأبواغ بكتيرية ، تعرف باسم مرض الحليب ، لأنها تنمو وتتكاثر داخل جسم الخنفساء. اليرقة والقضاء عليها.",
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "المزيد",
                  trimExpandedText: " ",
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      );
  //card6
  Widget night_crickets() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://thumbs.dreamstime.com/b/colorful-cricket-leaf-resting-48198550.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'صراصير الليل',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Container(
                padding: EdgeInsets.all(15),
                child: ReadMoreText(
                  "المعروف أيضا باسم صراصير المورمون ، وتتميز بفكها الحاد والقوي وتتغذى على الأعشاب والمحاصيل الحقلية والأشجار المثمرة ، وكذلك تسبب أضرارا كبيرة للمحاصيل الزراعية وتنقل الطفيليات والأمراض. ومن طرق مكافحة الليل الصراصير: 1) باستخدام الفخاخ اللاصقة فهي طريقة سهلة وغير صحية. 2) رش مبيدات حشرية خاصة لقتل الصراصير.",
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "المزيد ",
                  trimExpandedText: " ",
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00695C),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
