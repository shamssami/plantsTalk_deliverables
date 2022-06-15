import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plants_talk/screens/disease_detection/planthelath.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

String? selectedValue = null;
final _dropdownFormKey = GlobalKey<FormState>();
List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("5 hours"), value: "USA"),
    DropdownMenuItem(child: Text("10 Hours"), value: "Canada"),
    DropdownMenuItem(child: Text("15 Hours"), value: "Brazil"),
    DropdownMenuItem(child: Text("England"), value: "England"),
  ];
  return menuItems;
}

class _AllState extends State<All> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  var isToggled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
                // height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
              children: <Widget>[
                Hero(
                  tag: "Real Time Monitoring",
                  child: Image(
                      image: AssetImage('assets/images/gett2.jpg'),
                      color: Color.fromARGB(190, 47, 148, 136),
                      colorBlendMode: BlendMode
                          .modulate // color: Color.fromARGB(194, 255, 255, 255),

                      // Photo from https://unsplash.com/photos/2d4lAQAlbDA
                      ),
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(top: 160, left: 0, right: 0),
              child: Container(
                  padding: EdgeInsets.only(top: 20),
                  decoration:
                      BoxDecoration(color: Color.fromARGB(109, 60, 60, 60)),
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(children: <Widget>[
                          Text("Temperature",
                              style: GoogleFonts.lato(
                                  // fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 16)),
                          SizedBox(
                            height: 12,
                          ),
                          Text("34.4 C",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 26))
                        ]),
                        SizedBox(
                          width: 18,
                        ),

                        Column(children: <Widget>[
                          Text("Humidity",
                              style: GoogleFonts.lato(
                                  // fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 16)),
                          SizedBox(
                            height: 12,
                          ),
                          Text("33%",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 26))
                        ]),
                        SizedBox(
                          width: 18,
                        ),
                        Column(children: <Widget>[
                          Text("Soil Moisture",
                              style: GoogleFonts.lato(
                                  // fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 16)),
                          SizedBox(
                            height: 12,
                          ),
                          Text("20%",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 26))
                        ]),
                        //new Container()
                      ],
                    ),
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(top: 270, left: 20, right: 20),
                child: Container()),
            AppBar(
              centerTitle: true,
              title: Text(
                'Real Time Monitoring',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold, color: white, fontSize: 26),
                textAlign: TextAlign.center,
              ),
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 270, left: 20, right: 20),
              child: Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width - 24.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2.0,
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2.0)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: CircleAvatar(
                              backgroundColor: white,
                              child: Image(
                                image: AssetImage('assets/icons/usb.png'),
                                height: 40,
                                width: 50,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text('Connection',
                              style: GoogleFonts.lato(
                                  // fontWeight: FontWeight.bold,
                                  color: black,
                                  fontSize: 22)),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        FlutterSwitch(
                          height: 30.0,
                          width: 70.0,
                          padding: 2.0,
                          toggleSize: 30.0,
                          borderRadius: 15.0,
                          activeColor: Color.fromARGB(255, 42, 153, 140),
                          value: isToggled,
                          onToggle: (value) {
                            setState(() {
                              isToggled = value;
                            });
                          },
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(top: 450, left: 20, right: 20),
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
                        title: ChartTitle(text: 'Plant Data'),
                        borderWidth: 8,
                        plotAreaBorderWidth: 0.5,
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          StackedLineSeries<_SalesData, String>(
                              enableTooltip: true,
                              dataSource: data,
                              xValueMapper: (_SalesData data, _) => data.year,
                              yValueMapper: (_SalesData data, _) => data.sales),
                          StackedLineSeries<_SalesData, String>(
                              enableTooltip: true,
                              dataSource: data,
                              xValueMapper: (_SalesData data, _) => data.year,
                              yValueMapper: (_SalesData data, _) => data.sales),
                          StackedLineSeries<_SalesData, String>(
                              enableTooltip: true,
                              dataSource: data,
                              xValueMapper: (_SalesData data, _) => data.year,
                              yValueMapper: (_SalesData data, _) => data.sales),
                        ])))
          ],
        ),
      ],
    ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
