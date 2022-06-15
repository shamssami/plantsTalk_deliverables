import 'package:flutter/material.dart';
import 'package:plants_talk/Declarations/GetStartedPage.dart';
import 'package:plants_talk/widgets/GWidgets.dart';
import '5GetStartedBtn.dart';
import '3DotIndicator.dart';
import '2PageView.dart';

Widget buildBody(BuildContext context) => Container(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: (MediaQuery.of(context).size.height)),
          child: ValueListenableBuilder<double>(
            valueListenable: currentPage,
            builder: (context, value, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildPageView(context),
                  heightSpacer(30.00),
                  buildDotIndicator(),
                  heightSpacer(100.00),
                  buildGetStartedButton(context),
                ],
              );
            },
          ),
        ),
      ),
    );
