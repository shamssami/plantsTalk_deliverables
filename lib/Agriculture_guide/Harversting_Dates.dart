import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Harversting_Dates extends StatelessWidget {
  const Harversting_Dates({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

// to view the text in Arabic
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'),
      ],

      title: "route",
      home: Scaffold(
        body: Center(
          child: ListView(
            children: [
              DataTable(columns: [
                DataColumn(
                    label: Text(
                  'اسم المحصول ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                )),
                DataColumn(
                    label: Text(
                  ' موعد النضوج ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                )),
              ],
                  //rows
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('العدس ')),
                      DataCell(Text('۳ - ٤ أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('البازيلا ')),
                      DataCell(Text('٦۰ - ۹۰ يوم')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الفول ')),
                      DataCell(Text('۳ - ۳ ونصف أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الحمص ')),
                      DataCell(Text('۳ - ٤ أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('البصل ')),
                      DataCell(Text('۳ - ٥ أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الثوم ')),
                      DataCell(Text('۳ - ۳ ونصف أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الخس ')),
                      DataCell(Text('شهرين')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الفجل ')),
                      DataCell(Text('۳٥ - ۸۰ يوم')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('البقدونس ')),
                      DataCell(Text('شهرين')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الزهرة ')),
                      DataCell(Text('۲ ونصف - ۳ أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الملفوف ')),
                      DataCell(Text('۲ ونصف - ۳ أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('البطاطا ')),
                      DataCell(Text('۱۰۰ يوم')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الجزر ')),
                      DataCell(Text('۲ ونصف -  ۳  أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الفلفل ')),
                      DataCell(Text('۲ ونصف -  ۳ ونصف أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('البندورة ')),
                      DataCell(Text('۳ - ٥ أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الخيار ')),
                      DataCell(Text('۳ - ٥ أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الملوخية ')),
                      DataCell(Text('۲ ونصف -  ۳  أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الفاصوليا ')),
                      DataCell(Text('٥۰ - ۸۰ يوم')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('اللوبيا الصيفية ')),
                      DataCell(Text('شهرين')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('اللوبيا الخريفية ')),
                      DataCell(Text('شهرين')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الكوسا ')),
                      DataCell(Text('۳۰ - ۳٥ يوم')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الباذنجان ')),
                      DataCell(Text('۲ ونصف -  ۳ ونصف أشهر')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('البطيخ ')),
                      DataCell(Text('۱۰۰ يوم')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('الفليفلة ')),
                      DataCell(Text('۲ - ۳  أشهر')),
                    ]),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
