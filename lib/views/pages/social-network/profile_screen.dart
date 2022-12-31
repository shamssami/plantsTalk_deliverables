import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:plants_talk/providers/user_provider.dart';
import 'package:plants_talk/services/resources/auth_methods.dart';
import 'package:plants_talk/services/resources/firestore_methods.dart';
import 'package:plants_talk/services/resources/storage_methods.dart';

import 'package:plants_talk/views/pages/registeration/login_screen.dart';
import 'package:plants_talk/utils/colors.dart';
import 'package:plants_talk/utils/utils.dart';
import 'package:plants_talk/views/widgets/follow_button.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final auth = FirebaseAuth.instance;

late PickedFile _imageFile;
final ImagePicker _picker = ImagePicker();

class _HomeScreenState extends State<ProfileScreen> {
  var userData = {};

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData = userSnap.data()!;

      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', 'AE'), // English, no country code
          // Locale('es', ''), // Spanish, no country code
        ],
        home: Scaffold(
          //  backgroundColor: Colors.teal.shade100,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xFF00695C),
            //Color(0xff555555),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
                /////////////////////////// to backkk
              },
            ),
            actions: [],
          ),
          body: userData.length == 0
              ? Center(child: CircularProgressIndicator())
              : StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('posts')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {}
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 450,
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 15.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.person,
                                              size: 40.0,
                                              color: Colors.teal.shade800,
                                            ),
                                          ),
                                          SizedBox(width: 24.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                "الاسم",
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              SizedBox(height: 4.0),
                                              Text(
                                                " ${userData['firstname']} ${userData['secondname']}",
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    //card2
                                  ),

                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 15.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.email,
                                              size: 40.0,
                                              color: Colors.teal.shade800,
                                            ),
                                          ),
                                          SizedBox(width: 24.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                "البريد الالكتروني",
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              SizedBox(height: 4.0),
                                              Text(
                                                " ${userData['email']}",
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //card3
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 15.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.info,
                                              size: 40.0,
                                              color: Colors.teal.shade800,
                                            ),
                                          ),
                                          SizedBox(width: 24.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                "اسم المستخدم",
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              SizedBox(height: 4.0),
                                              Text(
                                                " ${userData['username']}",
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //card4
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 15.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.home,
                                              size: 40.0,
                                              color: Colors.teal.shade800,
                                            ),
                                          ),
                                          SizedBox(width: 24.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                "المدينة",
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              SizedBox(height: 4.0),
                                              Text(
                                                " ${userData['city']}",
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        CustomPaint(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                          painter: HeaderCurvedContainer(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "الصفحة الشخصية",
                                style: TextStyle(
                                  fontSize: 35,
                                  letterSpacing: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            //Container(

                            Stack(
                              children: [
                                (userData['photoUrl']) == ""
                                    ? const CircleAvatar(
                                        radius: 88,
                                        backgroundImage: NetworkImage(
                                            'https://i.stack.imgur.com/l60Hf.png'),
                                        backgroundColor:
                                            Color.fromARGB(255, 42, 153, 140),
                                      )
                                    : CircleAvatar(
                                        radius: 88,
                                        backgroundImage: NetworkImage(
                                          userData['photoUrl'],
                                        )),
                              ],
                            ),
                            // ),
                          ],
                        ),
                      ],
                    );
                  }),
        ));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFF00695C);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
