import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/Agriculture_guide/Planting_Dates.dart';

class purn extends StatelessWidget {
  const purn({Key? key}) : super(key: key);

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
            body: Center(
          child: ListView(
            //  mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                child: Text(
                  'المرحلة الاولى: معرفة ما الذي عليك تقليمه.',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  '1- تقييم الشجرة: امنح نفسك بعض الدقائق تقيم فيها حجم وشكل الشجرة وتخيل كيف سوف يكون شكلها بعد الانتهاء من تقليمها.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/p1.jpeg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '2- حدد الأفرع الرئيسية المكونة لهيكل الشجرة. حتى تتجنب إزالة تلك الفروع.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/p2.jpeg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '3 - أزل أولًا الأفرع التي يبدو عليها علامات التلف. يجب تقليم الأفرع المكسورة سواء كانت تالفة بسبب عاصفة أو أي عوامل أخرى من أجل إعادة توزيع الماء والعناصر الغذائية التي تستهلكها تلك الأفرع من الشجرة بدلًا عن الأفرع السليمة.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                  child: Image.asset(
                'assets/images/p33.jpeg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '4 - خفف المناطق الكثيفة بالفروع. أزل الأفرع المتقاطعة ثم افتح للنبات بحيث ينتشر الهواء والضوء في كافة أجزاء النبات. فالنباتات تحتاج إلى انتشار جيد للهواء عبر الفروع لتستطيع النمو بشكل صحي؛ إذا تعزز الأفرع المتشابكة نمو الفطريات وتجعلها عرضة للمزيد من الحشرات.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                child: Text(
                  'أزل الفروع الداخلية التي تنمو تجاه مركز الشجرة. إذ تكون تلك الفروع في الأغلب غير صحية كما أنها شكلها يكون فوضويًا.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(child: Image.asset('assets/images/pp.jpeg')),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '5 - قلِّم الأفرع التي تسبب العوائق. فمن الجيد إزالة الفروع التي قد تشكل نوع من الإزعاج سواء كانت هذه الفروع فروعًا منخفضة تعيق حركتك أو فروعًا مرتفعة تضعف شبكة هاتفك أو فروعًا تحتك بسقف منزلك أو تغطيه.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/p5.jpeg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '6 - قلم الأفرع لتساعد في تهيئة الشجرة. إذا أردت أن تأخذ الشجرة شكلًا دائريًا أنيقًا، فقلم الفروع القليلة الملتصقة في زوايا غريبة؛ فبعض التقليم سوف يحدث فرقًا شاسعًا.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/p6.jpeg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '7 - قلل من التقليم قدر المستطاع. فكل قطع تقوم به يخل بنظام حماية الشجرة ويعرضها للفطريات وغزو الحشرات. لذا، عليك تقليم ما ينبغي تقليمه فقط مع الوضع في الاعتبار أن لا تزيد نسبة تقليمك عن 25% من فروع الشجرة.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/p7.jpeg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  'المرحلة الثانية: التقليم من أجل تقليل التلف.',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  '1  - أخرج أدوات تقليمك في موسم السبات. فالتقليم في أواخر الخريف وبداية الشتاء يخفف الضغط على الشجرة، إذ إنه يقلل من فقدان عصارة النبات المعروفة بالنسغ. وتعتبر تلك الفترة من السنة هي أفضل فترة لتقليم الشجرة، حيث من المستبعد أن يتأثر "القطع" الذي قمت به بالحشرات أو الفطريات، والتي تكون نشطة نسبيًا في أواخر الخريف وأوائل الشتاء.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/pr1.jpg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/pr2.jpg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '2 - اقطع بدءًا من الجهة السفلية للفرع. مع العلم أن هذا القطع الأولي لا يجب أن يمتد لبقية الفرع. فإن فائدة هذا القطع تكمن في منع انكسار الفرع من منطقة اتصاله بالجذع عندما يكون على وشك للسقوط.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                child: Text(
                  'ينبغي قطع هذا الفرع من جانب الفرع المسمى بطوق الجذع. وهو الحافة الصغيرة من اللحاء التي يخرج منها كل فرع. كما يجب عليك ترك بداية الطوق سليمًا، لذا لا تقطع نماء الشجرة مع الجذع. ',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/pr3.jpeg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '3 - اقطع الفرع على بعد بوصات من الجذع. استخدم المنشار المرة الثانية عند قطع الفرع من الجهة الخارجية (بعيدًا عن الجذع) للقطع الأول الذي قمت به. أزل الفرع من المنطقة؛ بحيث يكون الجزء المتبقى هو جذل الشجرة.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  child: Image.asset(
                'assets/images/pr4.jpeg',
                fit: BoxFit.contain,
              )),
              SizedBox(height: 40),
              Container(
                child: Text(
                  '4 - اقطع قطعًا دقيقًا عند إزالة الجذع. يمكنك الآن القيام بقطع آخرتقريبًا أمام الطوق. بحيث يعطي هذا للشجرة الفرصة للتعافي بشكل سريع وسليم.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                child: Text(
                  'تأكد من عدم قطعك لطوق الفرع. إذ يجب أن تبقيه على حاله سليمًا.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 40),
              Container(
                  child: Image.asset(
                'assets/images/pr5.jpeg',
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  '5 - نظف أدوات التقليم. مع العلم أنه ليس من الضروري تطهير أدوات التقليم في حالة تجنبت قطع القروح النباتية والأجزاء المصابة من الشجرة، إلا أنه يُفضل تعقيم وتطهير أدوات تقليمك بالكحول أو بأي منظف منزلي آخر بعد كل قطع تقوم به في شجرة مصابة. أيضًا، ينبغي لك مسح الشفرات بقطعة قماش معقمة بعد الانتهاء من تقليم الشجرة السليمة قبل الانتقال للشجرة أو الشجيرة التالية. فأحيانًا تنتشر الأمراض من خلال آلات التقليم ومعداته المتسخة.',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        )));
  }
}
