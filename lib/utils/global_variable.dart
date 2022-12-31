import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plants_talk/views/pages/social-network/add_post_screen.dart';
import 'package:plants_talk/views/pages/social-network/feed_screen.dart';
import 'package:plants_talk/views/pages/social-network/profile_screen.dart';
import 'package:plants_talk/views/pages/social-network/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notifications'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
