import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plants_talk/screens/disease_detection/planthelath.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plants_talk/screens/real_time_monitoring/notification.dart';
import 'package:plants_talk/screens/real_time_monitoring/silverAppBar.dart';
import 'package:plants_talk/services/notifications-services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../services/disease-diagnosis.dart';

class Humidity extends StatefulWidget {
  const Humidity({Key? key}) : super(key: key);

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
//////////// Retrieve sensors data from real time database//////////////
  String humidity = '41';
  double humidityValue = 0;
  final now = DateTime.now();
  List<_HumidityData> list5 = [];
  String time = '0:0:0';
  String date = '7/5/2022';
  String mm = '0';
  String caption = 'Tempreature Value';

  // final database = FirebaseDatabase.instance.reference();
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
    _activeListeners();
  }

  void addData() {
    ref
        .child("humidity")
        .child('test')
        .set({'date': '16/04/2022', 'time': '3:06:38', 'value': "50"});
  }

  void _activeListeners() {
    const url =
        'https://plant-disease-detection-fbfee-default-rtdb.firebaseio.com/';

    ref.child("humidity").onChildAdded.listen((event) async {
      var data = event.snapshot.child('value').value;
      print('================================================' + humidity);
      setState(() {
        humidity = data.toString();

        mm = event.snapshot.child('value').value.toString();
        time = event.snapshot.child('time').value.toString();
        date = event.snapshot.child('date').value.toString();
        humidityValue = double.parse(humidity);

        list5.add(_HumidityData(humidityValue, date));
      });
      var hum = double.parse(humidity);

      if (hum > 70) {
        print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@notification hum >70');

        sendNotification(
            title: " انتبه!", body: "رطوبة الجو العالية قد تعرض محصولك للخطر.");
        caption = "رطوبة الجو عالية!";
      } else if (70 > hum && hum > 30) {
        caption = "أنا بخير!";

        print(
            'Humidity is goooooooooooooooooooooooooooooooooooooooddddddddddddddddddddd');
      } else {
        caption = "رطوبة الجو منخفضة!";

        sendNotification(
            title: " انتبه!",
            body: "رطوبة الجو المنخفضة قد تعرض محصولك للخطر.");

        print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@notify hum <30>');
      }
    });

    print(humidity);
  }

  ////
  List diseaseList = [];
  fetchDatabaseList() async {
    dynamic results =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getDiseasesList();
    if (results == null) {
      print(diseaseList.length);
      print('Unable to retrieve ...................');
    } else {
      setState(() {
        diseaseList = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        'out-------------------------------------=========================00000000000000000 stores');
    print(humidity);
    print(mm);
    print(date);
    print(humidity);

    print(
        'out-------------------------------------=========================00000000000000000 length of chartData:${list5.length} ');
    print(list5.length);
    print('/////////////////////////////////');

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color.fromARGB(245, 9, 114, 130),
                  expandedHeight: 230.0,
                  collapsedHeight: 210,
                  floating: false,
                  pinned: true,
                  title: Text('رطوبة الجو'),
                  centerTitle: true,
                  flexibleSpace: HeaderWidget(
                    value: humidity + '%',
                    image_path: 'assets/images/humidity.png',
                    caption: this.caption,
                  ),
                ),
                new SliverPadding(
                  padding: new EdgeInsets.all(10.0),
                  sliver: new SliverList(
                    delegate: new SliverChildListDelegate([
                      TabBar(
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          new Tab(
                              // icon: new Icon(Icons.table_chart),
                              text: "جداول"),
                          new Tab(
                              // icon: new Icon(Icons.analytics_outlined),
                              text: "الرسم البياني"),
                        ],
                      ),
                    ]),
                  ),
                ),
              ];
            },
            body: TabBarView(children: [
              Column(children: [
                DataTable(
                  // dataRowHeight: 20,
                  dataTextStyle: TextStyle(color: black, fontSize: 14),
                  columnSpacing: 80,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'اليوم',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'التاريخ',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'القيم',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('الخميس')),
                        DataCell(Text('26/5/2022')),
                        DataCell(Text('34')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('الجمعه')),
                        DataCell(Text('27/5/2022')),
                        DataCell(Text('30')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('السبت')),
                        DataCell(Text('28/5/2022')),
                        DataCell(Text('29')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('الاحد')),
                        DataCell(Text('29/5/2022')),
                        DataCell(Text('35')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('الاثنين')),
                        DataCell(Text('30/5/2022')),
                        DataCell(Text('30')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('الثلاثاء')),
                        DataCell(Text('31/5/2022')),
                        DataCell(Text('33')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ]),
              Expanded(
                flex: 2,
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2.0,
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2.0)
                                ])
                            // color: Color.fromARGB(255, 67, 161, 111),
                            ,
                            height: 300,
                            width: 350,
                            child: SfCartesianChart(
                                title: ChartTitle(text: 'بيانات النباتات'),
                                // plotAreaBackgroundColor: white,
                                borderWidth: 8,
                                plotAreaBorderWidth: 0.5,
                                primaryXAxis: CategoryAxis(),
                                series: <ChartSeries>[
                                  StackedLineSeries<_HumidityData, String>(
                                      enableTooltip: true,
                                      dataSource: list5,
                                      xValueMapper: (_HumidityData data, _) =>
                                          data.date,
                                      yValueMapper: (_HumidityData data, _) =>
                                          data.value),
                                ])))),
              )
            ])),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _HumidityData {
  _HumidityData(this.value, this.date);

  final double value;
  // final String time;
  final String date;
}