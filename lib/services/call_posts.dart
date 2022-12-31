import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plants_talk/utils/global_variable.dart';

import '../views/widgets/post_card.dart';

class CallPost extends StatefulWidget {
  const CallPost({Key? key}) : super(key: key);

  @override
  State<CallPost> createState() => _CallPostState();
}

class _CallPostState extends State<CallPost> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          print('=================================empty');
        } else {
          print('full');
        }

        return snapshot.data!.docs.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (ctx, index) => Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width > webScreenSize ? width * 0.3 : 0,
                    vertical: width > webScreenSize ? 15 : 0,
                  ),
                  child: PostCard(
                    snap: snapshot.data!.docs[index].data(),
                  ),
                ),
              );
      },
    );
  }
}
