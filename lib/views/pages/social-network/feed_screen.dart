import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants_talk/views/pages/disease_detection/Profile.dart';
import 'package:plants_talk/views/pages/social-network/add_post_screen.dart';
import 'package:plants_talk/services/call_posts.dart';
import 'package:plants_talk/views/pages/social-network/profile_screen.dart';
import 'package:plants_talk/views/pages/social-network/search_screen.dart';
import 'package:plants_talk/utils/colors.dart';
import 'package:plants_talk/utils/global_variable.dart';
import 'package:plants_talk/views/widgets/post_card.dart';
import 'package:plants_talk/utils/global_variable.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List<Widget> tabs = [
      AddPostScreen(),
    ];
    return Scaffold(
        backgroundColor:
            width > webScreenSize ? webBackgroundColor : mobileBackgroundColor,
        appBar: width > webScreenSize
            ? null
            : AppBar(
                backgroundColor: mobileBackgroundColor,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile(
                                  FirebaseAuth.instance.currentUser!.uid,
                                )));
                  },
                  child: Icon(
                    Icons.person, // add custom icons also
                  ),
                ),
                actions: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()));
                        },
                        child: Icon(
                          Icons.search,
                          size: 26.0,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddPostScreen()));
                        },
                        child: Icon(Icons.add_circle),
                      )),
                ],
              ),
        body: const CallPost());
  }
}
