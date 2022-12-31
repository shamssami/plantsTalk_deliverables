import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plants_talk/views/pages/plants_monitoring/call-notifications.dart';

import 'package:stepo/stepo.dart';
import 'package:spinner_input/spinner_input.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool status1 = false;
  bool status2 = true;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  bool status7 = false;
  bool status8 = false;
  bool isSwitchOn = false;

  Color _textColor = Colors.black;
  Color _appBarColor = Color.fromRGBO(36, 41, 46, 1);
  Color _scaffoldBgcolor = Colors.white;
/////////////////////////////////////////////////////////////////////////////

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  double spinner4 = 0;
  @override
  void initState() {
    super.initState();
    // _activeListeners();
  }

  // void _activeListeners() {
  //   const url =
  //       'https://plant-disease-detection-fbfee-default-rtdb.firebaseio.com/';

  //   ref.child("status").onChildChanged.listen((event) {
  //     var data = event.snapshot.child('value').value;
  //     setState(() {
  //       print(data);
  //       status1 = data.toString() as bool;
  //     });
  //   });

  //   print('Current Toggle arduin value ===========================');

  //   print(status1);
  // }

///////////////////////////
  ///
  var textValue = 'value';
  update(String token) {
    print(token);
    ref.child('fcm-token/${token}').set({"token": token});
    textValue = token;
    setState(() {});
    print('************************************************************');
    print(textValue);
  }

//////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    bool _lights = true;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          DrawerHeader(
            // padding: EdgeInsets.only(top: 40.0, right: 7.0),
            child: IconButton(
              alignment: Alignment.topRight,
              color: white,
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            decoration: BoxDecoration(
                // color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/background.jpg'))),
          ),
          // SwitchListTile(
          //   title: const Text('Arduino Connection'),
          //   value: _lights,
          //   onChanged: (bool value) {
          //     setState(() {
          //       _lights = value;
          //     });
          //   },
          //   secondary: const Icon(Icons.lightbulb_outline),
          // ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Icon(Icons.lightbulb_outline),
              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Arduino",
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 30),
                child: FlutterSwitch(
                  width: 55.0,
                  height: 25.0,
                  valueFontSize: 12.0,
                  toggleSize: 18.0,
                  value: status1,
                  onToggle: (val) {
                    status1 = val;
                    setState(() {
                      const url =
                          'https://plant-disease-detection-fbfee-default-rtdb.firebaseio.com/';

                      ref.update({
                        "status": val,
                      });

                      print(
                          'Current Toggle arduin value ===========================');

                      print(status1);
                    });
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Icon(Icons.lightbulb_outline),
              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tempreature",
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 30),
                child: FlutterSwitch(
                  width: 55.0,
                  height: 25.0,
                  valueFontSize: 12.0,
                  toggleSize: 18.0,
                  value: status2,
                  onToggle: (value) {
                    setState(() {
                      status2 = value;
                      const url =
                          'https://plant-disease-detection-fbfee-default-rtdb.firebaseio.com/';

                      ref.child('temp').update({
                        "status-temp": status2,
                      });

                      print(
                          'Current Toggle temp value ===========================');

                      print(status2);
                    });
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Icon(Icons.lightbulb_outline),
              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Humidity",
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 30),
                child: FlutterSwitch(
                  width: 55.0,
                  height: 25.0,
                  valueFontSize: 12.0,
                  toggleSize: 18.0,
                  value: status3,
                  onToggle: (value) {
                    setState(() {
                      status3 = value;
                      const url =
                          'https://plant-disease-detection-fbfee-default-rtdb.firebaseio.com/';

                      ref.child('humidity').update({
                        "status-humidity": status3,
                      });

                      print(
                          'Current Toggle humidity value ===========================');

                      print(status3);
                    });
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Icon(Icons.lightbulb_outline),
              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Soil Moisture",
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 30),
                child: FlutterSwitch(
                  width: 55.0,
                  height: 25.0,
                  valueFontSize: 12.0,
                  toggleSize: 18.0,
                  value: status4,
                  onToggle: (value) {
                    setState(() {
                      status4 = value;
                      const url =
                          'https://plant-disease-detection-fbfee-default-rtdb.firebaseio.com/';

                      ref.child('moisture').update({
                        "status-soil": status4,
                      });

                      print(
                          'Current Toggle soilmoisture value ===========================');

                      print(status4);
                    });
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Icon(Icons.lightbulb_outline),

              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Notifications",
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(right: 40),
                  child: Icon(Icons.notifications),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CallNotify()));
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Icon(Icons.lightbulb_outline),
              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Duration",
                ),
              ),
              Container(
                // padding: EdgeInsets.only(right: 10),
                child: SpinnerInput(
                  minValue: 5,
                  maxValue: 200,
                  disabledLongPress: true,
                  disabledPopup: true,
                  step: 5,
                  spinnerValue: spinner4,
                  onChange: (newValue) {
                    setState(() {
                      spinner4 = newValue;
                      const url =
                          'https://plant-disease-detection-fbfee-default-rtdb.firebaseio.com/';

                      ref.child('duration').update({
                        "value": spinner4,
                      });

                      print(
                          'Current Toggle soilmoisture value ===========================');

                      print(spinner4);
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
