import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plants_talk/views/widgets/empty_card.dart';
import 'package:plants_talk/views/widgets/itemCard.dart';

import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plants_talk/model/disease_model.dart';
import 'package:plants_talk/services/disease-diagnosis.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 6.0),
      height: MediaQuery.of(context).size.height * 0.28,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: EmptyCard(),
            );
          }),
    );
  }
}
