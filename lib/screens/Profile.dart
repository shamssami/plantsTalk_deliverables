import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plants_talk/Screens/Setting.dart';

import 'package:plants_talk/model/user.dart';
import 'package:plants_talk/model/user_model.dart';
import 'package:image_picker/image_picker.dart';

import 'package:plants_talk/resources/auth_methods.dart';
import 'package:plants_talk/screens/BottomAppBar.dart';
import 'package:plants_talk/screens/disease_detection/main_page.dart';
import 'package:plants_talk/utils/utils.dart';

class Profile extends StatefulWidget {
  final String uid;
  int dest;
  Profile(this.uid, [this.dest = 0]);
  // const Profile({Key? key, required this.uid, [this.dest]}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final auth = FirebaseAuth.instance;

late PickedFile _imageFile;
final ImagePicker _picker = ImagePicker();
// final profileEditingController = new TextEditingController();

class _HomeScreenState extends State<Profile> {
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
    return Scaffold(
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage(
                            uid: FirebaseAuth.instance.currentUser!.uid,
                          )));
            },
          ),
        ],
      ),
      body: userData.length == 0
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {}
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 500,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            (userData['photoUrl']) == null
                                ? const CircleAvatar(
                                    radius: 88,
                                    backgroundImage: AssetImage(
                                        'https://i.stack.imgur.com/l60Hf.png'),
                                    backgroundColor:
                                        Color.fromARGB(255, 42, 153, 140),
                                  )
                                : CircleAvatar(
                                    radius: 88,
                                    backgroundImage:
                                        NetworkImage(userData['photoUrl']),
                                    backgroundColor:
                                        Color.fromARGB(255, 42, 153, 140),
                                  ),
                          ],
                        ),
                        // ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 250, left: 160),
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()),
                            );
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[100],
                            size: 28.0,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
    );
  }

  ///

  ///
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "اختر صورة الملف الشخصي",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 30,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.camera),
                      onPressed: () {
                        takePhoto(ImageSource.camera);
                      },
                      label: Text("الكاميرا"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      // height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    FlatButton.icon(
                      icon: Icon(Icons.image),
                      onPressed: () {
                        takePhoto(ImageSource.gallery);
                      },
                      label: Text("المعرض"),
                    ),
                  ]))
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;

      FirebaseFirestore.instance.collection("users").doc(widget.uid).update({
        "photoUrl": _imageFile.path,
      });
    });
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
