import 'package:bulleted_list/bulleted_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plants_talk/views/Pages/social-network/add_post_screen.dart';
import 'package:plants_talk/services/classify.dart';
import 'package:plants_talk/services/disease-diagnosis.dart';
import 'package:plants_talk/services/result.dart';

class FloatingButtonAnimated extends StatefulWidget {
  @override
  _FloatingButtonAnimatedState createState() => _FloatingButtonAnimatedState();
}

class _FloatingButtonAnimatedState extends State<FloatingButtonAnimated>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    final tips_list = [''];

    Size size = MediaQuery.of(context).size;
    Classifier classifier = Classifier();
    return FloatingActionButton(
      onPressed: animate,
      child: SpeedDial(
        buttonSize: Size(60.0, 60.0),
        icon: Icons.camera_alt,
        spacing: 10,
        backgroundColor: Color.fromARGB(255, 42, 153, 140),
        children: [
          SpeedDialChild(
            child: const FaIcon(
              FontAwesomeIcons.image,
              color: Colors.white,
            ),
            label: "الاستوديو",
            backgroundColor: Color.fromARGB(255, 11, 117, 108),
            onTap: () async {
              late double _confidence;
              String disease_name = '';
              String arabic_name = '';

              String image_path = '';
              double confidence = 99.0;

              await classifier.getDisease(ImageSource.gallery).then((value) {
                image_path = classifier.imageFile.path;
                print(image_path);
                print('?????????????????????????????????????????????/');
                disease_name = value?[0]['label'];
                print(
                    'Disease name ***************************$disease_name********************************');
                _confidence = value?[0]['confidence'];
                print(
                    'Accuracy rate ***************************$_confidence********************************');
              });

              if (disease_name == 'Corn Health' ||
                  disease_name == 'Grape Healthy' ||
                  disease_name == 'Potato Healthy' ||
                  disease_name == 'Tomato Healthy' ||
                  disease_name == 'Strawberry Healthy') {
                arabic_name = 'نبات صحي';
              } else if (disease_name == 'Grape Black Rot') {
                arabic_name = 'تعفن العنب الأسود';
              } else if (disease_name == 'Northern Corn Leaf Blight') {
                arabic_name = 'لفحة أوراق الذرة الشمالية';
              } else if (disease_name == 'Potato Early Blight') {
                arabic_name = 'اللفحة المبكرة في البطاطس';
              } else if (disease_name == 'Strawberry Leaf Scorch') {
                arabic_name = 'حرق أوراق الفراولة';
              } else if (disease_name == 'Tomato Late Blight') {
                arabic_name = 'اللفحة المتأخرة في الطماطم';
              } else if (disease_name == 'background') {
                arabic_name = 'كائن غريب';
              }
              print('----------' + arabic_name);
              if (_confidence > 0.90) {
                ResultPage().resultPage(context, arabic_name, image_path);

                String _imageRef =
                    await DatabaseService(uid: uid).uploadImage(image_path);
                print(_imageRef);

                await DatabaseService(uid: uid).addDisease(
                    arabic_name, _imageRef, confidence, uid, DateTime.now());
                print('============================saved' + arabic_name);
              } else {
                print(
                    "##########   The Accuracy is lower than 0.55 ###########");

                showDialogWidget(context);
              }
            },
          ),
          //////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////
          SpeedDialChild(
              child: const FaIcon(
                FontAwesomeIcons.camera,
                color: Colors.white,
              ),
              label: "الكاميرا",
              backgroundColor: Color.fromARGB(255, 11, 117, 108),
              onTap: () async {
                late double _confidence;
                String disease_name = '';
                String arabic_name = '';

                String image_path = '';

                await classifier
                    .getDiseaseByCamera(ImageSource.camera)
                    .then((value) {
                  image_path = classifier.imageFile.path;
                  disease_name = value?[0]['label'];

                  print(
                      'Disease name ***************************$disease_name********************************');
                  _confidence = value?[0]['confidence'];
                  print(
                      'Accuracy rate ***************************$_confidence********************************');
                });
                if (disease_name == 'Corn Health' ||
                    disease_name == 'Grape Healthy' ||
                    disease_name == 'Potato Healthy' ||
                    disease_name == 'Tomato Healthy' ||
                    disease_name == 'Strawberry Healthy') {
                  arabic_name = 'نبات صحي';
                } else if (disease_name == 'Grape Black Rot') {
                  arabic_name = 'تعفن العنب الأسود';
                } else if (disease_name == 'Northern Corn Leaf Blight') {
                  arabic_name = 'لفحة أوراق الذرة الشمالية';
                } else if (disease_name == 'Potato Early Blight') {
                  arabic_name = 'اللفحة المبكرة في البطاطس';
                } else if (disease_name == 'Strawberry Leaf Scorch') {
                  arabic_name = 'حرق أوراق الفراولة';
                } else if (disease_name == 'Tomato Late Blight') {
                  arabic_name = 'اللفحة المتأخرة في الطماطم';
                } else if (disease_name == 'background') {
                  arabic_name = 'كائن غريب';
                }

                if (_confidence > 0.90) {
                  ResultPage().resultPage(context, arabic_name, image_path);

                  String _imageRef =
                      await DatabaseService(uid: uid).uploadImage(image_path);
                  print(_imageRef);

                  await DatabaseService(uid: uid).addDisease(
                      arabic_name, _imageRef, _confidence, uid, DateTime.now());

                  print('#####################saved to DB...............' +
                      arabic_name);
                } else {
                  print(
                      "##########   The Accuracy is lower than 0.55 ###########");
                  showDialogWidget(context);
                }
              }),

          SpeedDialChild(
            child: const FaIcon(
              FontAwesomeIcons.questionCircle,
              color: Colors.white,
            ),
            label: "نصائح",
            backgroundColor: Color.fromARGB(255, 11, 117, 108),
            onTap: () async {
              showDialogTipsDiagnosis(context);
            },
          ),
        ],
      ),
    );
  }

  void showDialogWidget(BuildContext context) {
    AlertDialog dialogWithImage = AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 120, color: Color.fromARGB(255, 42, 153, 140)),
                Column(
                  children: [
                    Icon(Icons.warning, color: Colors.white, size: 32),
                    // 8.height,
                    Text("تشخيص النبات",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                  ' دقة التشخيص لهذا المرض منخفضة، اختر احد الخيارات التالية لتحصل على نتيجة أفضل.',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 25,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 42, 153, 140))),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPostScreen()));
              },
              child: Text(
                'إضافة منشور',
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 42, 153, 140))),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
              child: Text(
                'التقط صورة أخرى',
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.all(0),
    );
    showDialog(
        context: context, builder: (BuildContext context) => dialogWithImage);
  }
}

/////////////////////////////////

showDialogTipsDiagnosis(BuildContext context) {
  var tips_list = [
    'اقترب من المحصول وتأكد من أن آفة المحصول موجودة داخل الإطار.',
    'تأكد من أن الكاميرا تركز بشكل صحيح على آفة المحاصيل.',
    'تأكد من أن المحصول مرئي بوضوح وأنه ليس غامقًا جدًا أو ساطعًا.',
    'يفضل أخذ عينة ورقية مصابة بالآفة وتصويرها على خلفية معزولة.'
  ];
  AlertDialog alert = AlertDialog(
    alignment: Alignment.center,
    // title: Text(
    //   'نصائح التشخيص',
    //   style: TextStyle(color: Color.fromARGB(255, 42, 153, 140)),
    // ),
    content: Container(
        height: 430,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 120, color: Color.fromARGB(255, 42, 153, 140)),
                Column(
                  children: [
                    // Icon(Icons., color: Colors.white, size: 32),
                    Image(
                      image: AssetImage('assets/icons/idea.png'),
                      height: 55,
                      width: 50,
                      color: white,
                    ),
                    // 8.height,
                    Text("نصائح التشخيص",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            BulletedList(
              crossAxisAlignment: CrossAxisAlignment.end,
              style: TextStyle(color: black, fontSize: 16),

              // bulletColor: Color.fromARGB(255, 42, 153, 140),
              listItems: tips_list,
              listOrder: ListOrder.ordered,
            ),
          ],
        )),
    actions: [
      TextButton(
        style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 42, 153, 140))),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        child: Text(
          'حسناً',
          style: TextStyle(
              color: whiteColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      )
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
