import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

PageController myPageViewController = new PageController(viewportFraction: 0.8);
final ValueNotifier<double> currentPage = ValueNotifier<double>(0.0);

List heading = <String>[
  "تشخيص النباتات",
  "دليل ارشادي زراعي",
  "صفحة تفاعلية",
  "دمج اجهزة استشعار للنباتات",
];

List subHeading = <String>[
"تشخيص مرضك من خلال صورته.",
  "دليل زراعي كامل عن دورة حياة النباتات" ,
  "صفحة تفاعلية تضم المستخدمين للتفاعل معًا", 
  "امكانية دمج مستشعرات المصنع ومراقبة معلوماتها من خلال التطبيق",
];
