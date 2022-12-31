import 'package:flutter/material.dart';
import 'package:plants_talk/views/widgets/BottomAppBar.dart';
import '4NxtBackBtn.dart';

final ValueNotifier<double> currentPage = ValueNotifier<double>(0.0);

Widget buildGetStartedButton(BuildContext context) => currentPage.value == 3
    ? Container(
        width: (MediaQuery.of(context).size.width) - 25,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.teal.shade700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.00),
            ),
          ),
          child: Text(
            " ابدأ الاّن",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.00,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TabsDemoScreen()));
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("سياسة التطبيق"),
                    content: (Text(
                      "لا يُقصد بالمعلومات والنصائح والمواد المتاحة من خلال التطبيق أن تشكل نصيحة مهنية أو تشخيصًا أو علاجًا ، أو لتحل محل الحكم المهني. أنت تتحمل كامل المخاطر والمسؤولية عن استخدام المعلومات التي تحصل عليها من أو من خلال هذا التطبيق ، وتوافق على أن الشركة ليست مسؤولة أو مسؤولة عن أي مطالبة أو خسارة أو ضرر أو تكلفة أو مصاريف أو التزام ناشئ عن استخدام المعلومات المشورة والمواد والتطبيق.",
                    )),
                    //  Container(

                    // )
                    actions: <Widget>[
                      FlatButton(
                        child: Text('موافق'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabsDemoScreen()));
                        },
                      ),
                    ],
                  );
                });
          },
        ),
      )
    : buildNextbackBtn(currentPage.value.toDouble());
