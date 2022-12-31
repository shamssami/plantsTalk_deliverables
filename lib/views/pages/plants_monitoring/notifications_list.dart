import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:plants_talk/services/notifications-services.dart';

class NotificationsList extends StatefulWidget {
  const NotificationsList({Key? key}) : super(key: key);

  @override
  _NotificationsListState createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  List notificationsList = [];
  fetchDatabaseList() async {
    dynamic results =
        await NotificationService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getNotifications();
    print('ddddddddddddddddddd');
    print(notificationsList.length);

    if (results == null) {
      print(notificationsList.length);
      print('Unable to retrieve ...................');
    } else {
      setState(() {
        notificationsList = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;

    return Scaffold(
        body: notificationsList == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.only(top: 12),
                child: ListView.builder(
                    itemCount: notificationsList.length,
                    itemBuilder: (context, index) {
                      return GFListTile(
                        avatar: Image.asset('assets/images/warning.png',
                            height: 35, width: 36),
                        padding: const EdgeInsets.only(left: 4, bottom: 15),
                        titleText: '${notificationsList[index]['title']}',
                        subTitleText: '${notificationsList[index]['body']}',
                      );
                    }),
              ));
  }
}
