import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plants_talk/screens/real_time_monitoring/humidity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:plants_talk/screens/real_time_monitoring/monitor.dart';
import 'package:plants_talk/screens/real_time_monitoring/notification.dart';

class Sensor extends StatefulWidget {
  const Sensor({Key? key}) : super(key: key);

  @override
  State<Sensor> createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('Real Time Monitoring'),
        centerTitle: true,
        actions: <Widget>[
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Monitor()));
            },
            icon: Icon(Icons.person),
          )
        ],
        //
        backgroundColor: Color.fromARGB(255, 42, 153, 140),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                ),
                Card(
                  color: Color.fromARGB(255, 42, 153, 140),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 30.0,
                    ),
                    child: ListTile(
                      leading: Image(
                        width: 50,
                        height: 70,
                        image: AssetImage(
                          'assets/images/temperature_icon.png',
                        ),
                      ),
                      title: const Text(
                        'Tempreature',
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: white,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Humidity()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30.0,
                          color: Colors.teal.shade800,
                        ),
                      ),
                      selected: true,
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  color: Color.fromARGB(255, 42, 153, 140),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 30.0,
                    ),
                    child: ListTile(
                      leading: Image(
                        width: 50,
                        height: 70,
                        image: AssetImage(
                          'assets/images/humidity.png',
                        ),
                      ),
                      title: const Text(
                        'Humidity',
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: white,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30.0,
                          color: Colors.teal.shade800,
                        ),
                      ),
                      selected: true,
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  color: Color.fromARGB(255, 42, 153, 140),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 30.0,
                    ),
                    child: ListTile(
                      leading: Image(
                        width: 50,
                        height: 70,
                        image: AssetImage(
                          'assets/images/soil-moisture.png',
                        ),
                      ),
                      title: const Text(
                        'Soil Moisture',
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: white,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30.0,
                          color: Colors.teal.shade800,
                        ),
                      ),
                      selected: true,
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
