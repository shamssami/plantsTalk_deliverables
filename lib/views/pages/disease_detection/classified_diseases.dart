import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plants_talk/services/disease-diagnosis.dart';

import 'package:provider/provider.dart';
import 'package:plants_talk/model/disease_model.dart';
import 'package:plants_talk/services/result.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/utils.dart';

class ClassifiedDiseases extends StatefulWidget {
  @override
  _ClassifiedDiseasesState createState() => _ClassifiedDiseasesState();
}

class _ClassifiedDiseasesState extends State<ClassifiedDiseases> {
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

  deleteDiagnosis(String diagnoseID) async {
    try {
      await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .deleteDiagnosis(diagnoseID);
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;

    return Scaffold(
      body: diseaseList == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 2.0, bottom: 4.0),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: diseaseList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var name = diseaseList[index]['name'];
                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.32,
                                width: MediaQuery.of(context).size.width * 0.32,
                                child: Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius:
                                          new BorderRadius.circular(12.0),
                                      child: Hero(
                                        tag: "${name}",
                                        child: Image.network(
                                          diseaseList[index]['image'],
                                          fit: BoxFit.fill,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.30,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.30,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(right: 10, top: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 45.0),
                                width: width - (width / 3) - 16,
                                height: width / 2.4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${diseaseList[index]['name']}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      // Text(
                                      //   "اقرأ",
                                      //   style: TextStyle(
                                      //       color: Colors.blue),
                                      // ),
                                      child: Icon(Icons.arrow_back_ios_new,
                                          size: 16, color: Colors.black),

                                      onTap: () {
                                        ResultPage().resultPage(
                                            context,
                                            '${diseaseList[index]['name']}',
                                            '${diseaseList[index]['image']}');
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ]),
            ),
    );
  }
}
