import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plants_talk/views/pages/plants_monitoring/notifications_list.dart';

import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plants_talk/model/disease_model.dart';
import 'package:plants_talk/services/disease-diagnosis.dart';

class CallNotify extends StatelessWidget {
  const CallNotify({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget toolBarTitle(var title, {textColor = const Color(0xFF1e253a)}) {
      return Text(
        title,
        style:
            TextStyle(fontSize: 20.0, fontFamily: 'Bold', color: Colors.black),
      );
    }

    Widget appBar(context, var title, {actions}) {
      return AppBar(
        title: toolBarTitle(title),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        titleSpacing: 0,
        iconTheme: IconThemeData(color: Color(0xFF1e253a)),
        backgroundColor: Colors.white.withOpacity(0.1),
        elevation: 0,
        actions: actions,
      );
    }

    return StreamProvider<List<DiseaseModel>?>.value(
      value:
          DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).diseases,
      initialData: null,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 42, 153, 140),
        appBar: AppBar(
          title: toolBarTitle('Notifications', textColor: white),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          titleSpacing: 0,
          iconTheme: IconThemeData(color: Color(0xFF1e253a)),
          backgroundColor: Colors.white.withOpacity(0.1),
          elevation: 0,
        ),
        body: NotificationsList(),
      ),
    );
  }
}
