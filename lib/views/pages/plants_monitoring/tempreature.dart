import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:plants_talk/services/notification.dart';
import 'package:plants_talk/views/widgets/silverAppBar.dart';
import 'package:plants_talk/services/disease-diagnosis.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Tempreature extends StatefulWidget {
  const Tempreature({Key? key}) : super(key: key);

  @override
  State<Tempreature> createState() => _TempreatureState();
}

class _TempreatureState extends State<Tempreature> {
//////////// Retrieve sensors data from real time database//////////////
  String temperature = '30';

  double tempValue = 0;
  final now = DateTime.now();
  List<_TempData> list5 = [];
  String time = '0:0:0';
  String date = '7/5/2022';
  String mm = '0';
  String caption = 'درجة الحرارة';
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
    _activeListeners();
  }

  void addData() {
    ref
        .child("temp")
        .child('test')
        .set({'date': '16/04/2022', 'time': '3:06:38', 'value': "50"});
  }

  void _activeListeners() {
    const url =
        'https://plant-disease-detection-fbfee-default-rtdb.firebaseio.com/';

    ref.child("temp").onChildAdded.listen((event) async {
      var data = event.snapshot.child('value').value;
      setState(() {
        print(data);
        temperature = data.toString();

        mm = event.snapshot.child('value').value.toString();
        time = event.snapshot.child('time').value.toString();
        date = event.snapshot.child('date').value.toString();
        tempValue = double.parse(temperature);

        list5.add(_TempData(tempValue, date));
      });

      var temp = double.parse('$temperature');

      if (temp > 70) {
        sendNotification(
            title: " انتبه!",
            body: "درجة الحرارة العالية قد تعرض محصولك للخطر.");

        caption = "درجة الحرارة عالية!";
      } else if (70 > temp && temp > 30) {
        caption = "أنا بخير!";
      } else if (temp < 30 && temp > 0) {
        caption = "درجة الحرارة منخفضة!";

        sendNotification(
            title: "انتبه!",
            body: "درجة الحرارة المنخفضة قد تعرض محصولك للخطر.");
      } else {
        caption = "غير متصل!";
        sendNotification(
            title: "انقطع التصال!", body: "الجهاز غير متصل بالمستشعرات.");
      }
    });

    print('Current Temp Value is == ' + temperature);
  }

  var textValue = 'value';
  update(String token) {
    print(token);
    ref.child('fcm-token/${token}').set({"token": token});
    textValue = token;
    setState(() {});
    print('************************************************************');
    print(textValue);
  }

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
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  // leading: Icon(Icons.add),
                  backgroundColor: Color.fromARGB(245, 243, 119, 61),
                  expandedHeight: 230.0,
                  collapsedHeight: 210,

                  floating: false,
                  pinned: true,
                  title: Text('درجة الحرارة'),
                  centerTitle: true,
                  flexibleSpace: HeaderWidget(
                    value: temperature + '°C',
                    image_path: 'assets/images/temperature.png',
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
              Container(
                padding: EdgeInsets.only(top: 20),
                child: DataTable(
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
              ),
              Center(
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
                              ]),
                          height: 300,
                          width: 350,
                          child: SfCartesianChart(
                              title: ChartTitle(text: 'بيانات النباتات'),
                              borderWidth: 8,
                              plotAreaBorderWidth: 0.5,
                              primaryXAxis: CategoryAxis(),
                              series: <ChartSeries>[
                                StackedLineSeries<_TempData, String>(
                                    enableTooltip: true,
                                    dataSource: list5,
                                    xValueMapper: (_TempData data, _) =>
                                        data.date,
                                    yValueMapper: (_TempData data, _) =>
                                        data.value),
                              ])))),
            ])),
      ),
    );
  }
}

class _TempData {
  _TempData(this.value, this.date);

  final double value;
  final String date;
}
