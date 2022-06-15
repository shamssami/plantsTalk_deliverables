import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter/material.dart';
import 'package:plants_talk/Declarations/GetStartedPage.dart';
import 'package:plants_talk/Declarations/Global/GlobalDeclarations.dart';

Widget buildDotIndicator() => SmoothPageIndicator(
      controller: myPageViewController,
      count: 4,
      effect: WormEffect(
          activeDotColor: Colors.black,
          dotWidth: 10.0,
          dotHeight: 10,
          dotColor: Colors.amber),
    );
