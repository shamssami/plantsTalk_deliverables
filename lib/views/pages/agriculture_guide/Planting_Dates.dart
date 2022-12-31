import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Planting_Dates extends StatelessWidget {
  const Planting_Dates({Key? key}) : super(key: key);

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
                  ' موعد الزراعة ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                )),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('العدس ')),
                  DataCell(Text('كانون الثاني-شباط')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text('البازيلا ')),
                  DataCell(Text(' أيلول - شباط')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text('الفول ')),
                  DataCell(Text(' أيلول - كانون الأول')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text('الحمص ')),
                  DataCell(Text('كانون الثاني - اّذار')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text('السبانخ ')),
                  DataCell(Text(' أيلول - نيسان')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text('البصل ')),
                  DataCell(Text('تشرين الثاني - كانون الثاني')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text('الثوم ')),
                  DataCell(Text('تشرين الثاني - كانون الثاني')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text('الخس ')),
                  DataCell(Text(' اّب - تشرين الأول')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text('الزهرة ')),
                  DataCell(Text(' اّب - أيلول')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الملفوف')),
                  DataCell(Text(' اّب - أيلول')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' البطاطا')),
                  DataCell(Text(' أيلول - كانون أول')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الجزر')),
                  DataCell(Text(' أيلول - تشرين الثاني')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الفلفل')),
                  DataCell(Text(' اّب - أيلول')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' البندورة')),
                  DataCell(Text(' كانون الثاني - نيسان')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الخيار')),
                  DataCell(Text(' شباط - اّذار')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الملوخية')),
                  DataCell(Text(' اّذار - أيلول')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الفاصوليا')),
                  DataCell(Text(' شباط - نيسان')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text('   اللوبيا الصيفية ')),
                  DataCell(Text(' نيسان - أيار')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' اللوبيا الخريفية ')),
                  DataCell(Text(' تموز - اّب')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' البامية')),
                  DataCell(Text(' نيسان - أيار')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الكوسا')),
                  DataCell(Text(' اّذار - نيسان')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الباذنجان')),
                  DataCell(Text(' اّذار - حزيران')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' البطيخ')),
                  DataCell(Text(' اّذار - نيسان')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الفليفلة')),
                  DataCell(Text(' شباط - حزيران')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' النعنع')),
                  DataCell(Text('  نيسان')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الزعتر')),
                  DataCell(Text(' اّذار - نيسان')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' البابونج')),
                  DataCell(Text(' اّذار - نيسان')),
                  //
                ]),
                DataRow(cells: [
                  DataCell(Text(' الميرمية')),
                  DataCell(Text(' اّذار - نيسان')),
                  //
                ]),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
