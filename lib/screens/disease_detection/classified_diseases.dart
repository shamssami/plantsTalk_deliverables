import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plants_talk/services/disease-diagnosis.dart';

import 'package:provider/provider.dart';
import 'package:plants_talk/model/disease_model.dart';
import 'package:plants_talk/services/result.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/utils.dart';

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
                                              0.32,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.32,
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
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          useRootNavigator: false,
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: ListView(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 16),
                                                  shrinkWrap: true,
                                                  children: [
                                                    'حذف',
                                                  ]
                                                      .map(
                                                        (e) => InkWell(
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 12,
                                                                  horizontal:
                                                                      16),
                                                              child: Text(e),
                                                            ),
                                                            onTap: () {
                                                              deleteDiagnosis(diseaseList[
                                                                          index]
                                                                      [
                                                                      'diagnoseID']
                                                                  .toString());
                                                              // remove the dialog box
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }),
                                                      )
                                                      .toList()),
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.more_vert),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: width - (width / 3) - 16,
                                height: width / 2.4,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${diseaseList[index]['name']}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Bold',
                                          fontSize: 20.0),
                                    ),
                                    Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          // Row(
                                          //   children: <Widget>[
                                          //     Icon(Icons.timelapse,
                                          //         size: 16,
                                          //         color: Color(0XFF747474)),
                                          //     SizedBox(width: 2),
                                          //     Text("5 mins read")
                                          //   ],
                                          // ),
                                          GestureDetector(
                                            child: Row(
                                              children: <Widget>[
                                                // Text(
                                                //   "اقرأ",
                                                //   style: TextStyle(
                                                //       color: Colors.blue),
                                                // ),
                                                Icon(Icons.keyboard_arrow_right,
                                                    size: 16,
                                                    color: Colors.blue),
                                              ],
                                            ),
                                            onTap: () {
                                              ResultPage().resultPage(
                                                  context,
                                                  '${diseaseList[index]['name']}',
                                                  '${diseaseList[index]['image']}');
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Divider(
                                        height: 1,
                                        color: Color(0xFFDADADA),
                                        thickness: 1,
                                      ),
                                      SizedBox(height: 10),
                                    ])
                                  ],
                                ),
                              )
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
