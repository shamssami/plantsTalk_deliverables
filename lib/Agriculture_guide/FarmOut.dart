import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/Agriculture_guide/Planting_Dates.dart';

class FarmOut extends StatelessWidget {
  const FarmOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              title: const Text('كيفية الزراعة'),
              backgroundColor: Colors.teal.shade700,
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
            body: Center(
              child: ListView(
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      '1 - إذا كانت التربة لديك غير مستخدمة منذ سنوات وقاسية، فمن الأفضل بداية أن تنظّفها من الأعشاب الضارة ثم تضيف إليها السماد العضوي وتخلطه بالتراب (حراثة).',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Image.asset(
                    'assets/images/farm1.png',
                    fit: BoxFit.contain,
                  )),
                  SizedBox(height: 40),
                  Container(
                    child: Text(
                      '  2 - حضّر البذور والشتلات التي تنوي زراعتها (متوفّرة في محلات الزراعة والمشاتل). إحسب المسافات جيدا لتعرف عدد الشتلات التي تستوعبها حديقتك. يجب أن تكون المسافة الفاصلة بين كل شتلة \ شجرة حوالي 5 أمتار، لكي لا تتزاحم الأشجار لاحقا عندما تكبر.',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Image.asset(
                    'assets/images/farm2.png',
                    fit: BoxFit.contain,
                  )),
                  SizedBox(height: 40),
                  Container(
                    child: Text(
                      '3 – ري النباتات بكمية مناسبة من الماء. ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Text(
                        'في أيام الصيف الحارة يٌفضل القيام بعملية الري في الصباح الباكر، أو في وقت الغروب، وذلك حتى يحصل النبات على أقصى استفادة ممكنة. ',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Image.asset(
                    'assets/images/farm3.png',
                    fit: BoxFit.contain,
                  )),
                  SizedBox(height: 40),
                  Container(
                    child: Text(
                        '4 – العناية بالنباتات، تتضمن هذه العملية في الحفاظ على برنامج ري منتظم، والقيام بعملية التقليب والنبش والحرث للتربة، وكذلك القيام بعملية التعشيب (ازالة الأعشاب الضارة التي تنافس النباتات بالماء والغذاء). ',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    child: Text(
                        ' يمكنك أيضا القيام بعملية تسميد التربة (إضافة مواد كيميائية أو عضوية للتربة) بهدف زيادة خصوبة التربة وبالتالي رفع الإنتاج الزراعي.',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Image.asset(
                    'assets/images/farm4.png',
                    fit: BoxFit.contain,
                  )),
                  SizedBox(height: 40),
                  Container(
                    child: Text(' 4 - ستنمو النبتة وتكبر.',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Image.asset(
                    'assets/images/farm5.png',
                    fit: BoxFit.contain,
                  )),
                  SizedBox(height: 40),
                  Container(
                    child: Text(' 5 - ستزهر النبتة.',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Image.asset(
                    'assets/images/farm6.png',
                    fit: BoxFit.contain,
                  )),
                  SizedBox(height: 40),
                  Container(
                    child: Text('6 - ستثمر النبتة وتصبح جاهزة للحصاد. ',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Image.asset(
                    'assets/images/farm7.png',
                    fit: BoxFit.contain,
                  )),
                ],
              ),
            )));
  }
}
