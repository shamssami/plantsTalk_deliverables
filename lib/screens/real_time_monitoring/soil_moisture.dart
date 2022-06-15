// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:plants_talk/screens/real_time_monitoring/notification.dart';
import 'package:plants_talk/screens/real_time_monitoring/silverAppBar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SOilMoisture extends StatefulWidget {
  const SOilMoisture({Key? key}) : super(key: key);

  @override
  State<SOilMoisture> createState() => _SOilMoistureState();
}

class _SOilMoistureState extends State<SOilMoisture> {
  List<_MoistureData> list5 = [];
  String moisture = '20';
  String time = '0:0:0';
  String date = '7/5/2022';
  double moistureValue = 0;
  String mm = '0';
  String caption = 'حالة رطوبة التربة';

  DatabaseReference ref = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    super.initState();
    _activeListeners();
  }

  void addData() {
    ref
        .child("moisture")
        .child('test')
        .set({'date': '25/05/2022', 'time': '8:45:38', 'value': "33"});
  }

  List<_MoistureData> chartData = [];
  void _activeListeners() {
    const url =
        'https://plant-disease-detection-fbfee-default-rtdb.firebaseio.com/';

    ref.child("moisture").onChildAdded.listen((event) {
      var data = event.snapshot.child('value').value;

      setState(() {
        print(data);
        moisture = data.toString();
        mm = event.snapshot.child('value').value.toString();
        moistureValue = double.parse(moisture);
        time = event.snapshot.child('time').value.toString();
        date = event.snapshot.child('date').value.toString();
        list5.add(_MoistureData(moistureValue, date));

        //
      });

      var mois = double.parse('$moisture');

      if (mois > 70) {
        print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@notification mois >70');
        caption = "رطوبة التربة عالية!";

        sendNotification(title: "انتبه!", body: "رطوبة تربة نباتك عالية جدا.");
      } else if (70 > mois && mois > 30) {
        caption = "أنا بخير!";

        print(
            'Soil Moisture is goooooooooooooooooooooooooooooooooooooooddddddddddddddddddddd');
      } else if (mois < 30) {
        caption = "رطوبة التربة منخفضة!";
        sendNotification(title: "انتبه!", body: "رطوبة تربة نباتك منخفضة جدا.");

        print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@notify moisture <30>');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        'out-------------------------------------=========================00000000000000000 stores');
    print(moisture);
    print(mm);
    print(date);
    print(moistureValue);

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
                  backgroundColor: Color.fromARGB(245, 185, 151, 57),
                  expandedHeight: 230.0,
                  collapsedHeight: 210,
                  floating: false,
                  pinned: true,
                  title: const Text('رطوبة التربة'),
                  centerTitle: true,
                  flexibleSpace: HeaderWidget(
                    value: moisture + '%',
                    image_path: 'assets/images/soil-moisture.png',
                    caption: this.caption,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(10.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
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
              Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: DataTable(
                    // dataRowHeight: 20,
                    dataTextStyle: const TextStyle(color: black, fontSize: 14),
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
                  )),
              Center(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2.0,
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2.0)
                              ]),
                          height: 300,
                          width: 350,
                          child: SfCartesianChart(
                              title: ChartTitle(text: 'بيانات النبات'),
                              borderWidth: 8,
                              plotAreaBorderWidth: 0.5,
                              primaryXAxis: CategoryAxis(),
                              series: <ChartSeries>[
                                StackedLineSeries<_MoistureData, String>(
                                    enableTooltip: true,
                                    dataSource: list5,
                                    xValueMapper: (_MoistureData data, _) =>
                                        data.date,
                                    yValueMapper: (_MoistureData data, _) =>
                                        data.value),
                              ])))),
            ])),
      ),
    );
  }
}

class _MoistureData {
  _MoistureData(this.value, this.date);

  final double value;
  final String date;
}
