import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:plants_talk/services/disease-diagnosis.dart';
import 'package:plants_talk/utils/itemCard.dart';

class HistorySection extends StatefulWidget {
  @override
  _HistorySectionState createState() => _HistorySectionState();
}

class _HistorySectionState extends State<HistorySection> {
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: diseaseList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: diseaseList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ItemCard(
                        title: diseaseList[index]['name'],
                        photo: diseaseList[index]['image'],
                      ),
                    );
                  }),
            ),
    );
  }
}
