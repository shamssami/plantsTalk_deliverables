import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter/material.dart';

PageController myPageViewController = new PageController(viewportFraction: 0.8);

Widget buildDotIndicator() => SmoothPageIndicator(
      controller: myPageViewController,
      count: 4,
      effect: WormEffect(
          activeDotColor: Colors.black,
          dotWidth: 10.0,
          dotHeight: 10,
          dotColor: Colors.amber),
    );
