import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plants_talk/views/pages/registeration/login_screen.dart';
import 'package:plants_talk/utils/utils.dart';

class SettingsPage extends StatefulWidget {
  final String uid;
  const SettingsPage({Key? key, required this.uid}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final auth = FirebaseAuth.instance;

  String? errorMessage;
  final formkey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final userNameEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final cityEditingController = new TextEditingController();
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
          appBar: AppBar(
            title: const Text('الاعدادات'),
            centerTitle: true,
            backgroundColor: Colors.teal.shade800,
            elevation: 1,
            leading: IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: ListView(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.teal.shade800,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "الحساب",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                changeFirstName(context, "تعديل الاسم الاول"),
                changeSecondName(context, "تعديل الاسم الثاني"),
                changeUserName(context, "تعديل اسم المستخدم"),
                changePassword(context, "تغيير كلمةالمرور"),
                changeCity(context, "تعديل المدينة"),
                removePic(context, "حذف صورة الملف الشخصي"),
                SizedBox(
                  height: 40,
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: RaisedButton(
                    color: Colors.teal.shade800,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    onPressed: () {
                      logout();
                    },
                    child: Text("تسجيل الخروج",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2.2,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
          ),
        ));
  }

//////////////////////
  GestureDetector changeFirstName(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      autofocus: false,
                      controller: firstNameEditingController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("لا يمكن ان يكون الاسم الاول فارغا");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("يجب ان يكون الاسم الاول اكتر من 3 احرف");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        firstNameEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "الاسم الاول",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        if (firstNameEditingController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg:
                                  "لا يمكن ان يكون الاسم الاول  فارغا \u{274C}");
                        } else {
                          edit(firstNameEditingController.text);
                          Fluttertoast.showToast(
                              msg: "تم تعديل الاسم الاول \u{2705} ");
                        }
                        Navigator.pop(context);
                      },
                      child: Text("حفظ")),
                ],
              );
            });
      },
      //method2

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector changeSecondName(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      autofocus: false,
                      controller: secondNameEditingController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("لا يمكن ان يكون الاسم الثاني فارغا");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        secondNameEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "الاسم الثاني",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        if (secondNameEditingController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg:
                                  "لا يمكن ان يكون الاسم الثاني  فارغا \u{274C}");
                        } else {
                          editSecondName(secondNameEditingController.text);
                          Fluttertoast.showToast(
                              msg: "تم تعديل الاسم الثاني \u{2705} ");
                        }
                        Navigator.pop(context);
                        //    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                      },
                      child: Text("حفظ")),
                ],
              );
            });
      },
      //method2

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  //////////////////////
  //////////////////////
  GestureDetector changeUserName(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      autofocus: false,
                      controller: userNameEditingController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("لا يمكن ان يكون اسم المستخد فارغا");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        userNameEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "اسم المستخدم",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        if (userNameEditingController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg:
                                  "لا يمكن ان يكون اسم المستخدم فارغا \u{274C}");
                        } else {
                          editUserName(userNameEditingController.text);
                          Fluttertoast.showToast(
                              msg: "تم تعديل اسم المستخدم \u{2705}");
                        }
                        Navigator.pop(context);
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                      },
                      child: Text("حفظ")),
                ],
              );
            });
      },
      //method2

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector changePassword(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      autofocus: false,
                      controller: passwordEditingController,
                      obscureText: true,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Password is required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password(Min. 6 Character)");
                        }
                      },
                      onSaved: (value) {
                        passwordEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "كلمة المرور",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        editPassword(passwordEditingController.text);
                        Fluttertoast.showToast(
                            msg: "تم تغير كلمة المرور \u{2705}");
                        Navigator.pop(context);
                      },
                      child: Text("حفظ")),
                ],
              );
            });
      },
      //method2

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector changeCity(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      autofocus: false,
                      controller: cityEditingController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("لا يمكن ان يكون المدينة فارغا");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        cityEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.home),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "المدينة",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        if (cityEditingController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "لا يمكن ان يكون الميدنة فارغا \u{274C} ");
                        } else {
                          editCity(cityEditingController.text);
                          Fluttertoast.showToast(
                              msg: "تم تعديل المدينة \u{2705} ");
                        }
                        Navigator.pop(context);
                      },
                      child: Text("حفظ")),
                ],
              );
            });
      },
      //method2

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector removePic(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text("هل انت متأكد انك تريد حذف صورتك الشخصية؟")],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        removeProfilePic();
                        Fluttertoast.showToast(
                            msg: "تم حفذ صورتك الشخصية \u{2705} ");
                        Navigator.pop(context);
                      },
                      child: Text("نعم!")),
                ],
              );
            });
      },
      //method2

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

void edit(
  String firstname,
) async {
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        "firstname": firstname,
      });
    }
  });
}

void editSecondName(
  String SecondName,
) async {
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        "secondname": SecondName,
      });
    }
  });
}

void editUserName(
  String username,
) async {
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        "username": username,
      });
    }
  });
}

//edit password method
void editPassword(String password) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      _auth.currentUser?.updatePassword(password);
    }
  });
}

//edit city method
void editCity(
  String city,
) async {
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        "city": city,
      });
    }
  });
}

void logout() async {
  FirebaseAuth.instance.signOut();

  runApp(new MaterialApp(
    home: new LoginScreen(),
  ));
}

void removeProfilePic() async {
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        //"password": password,
        "photoUrl": "",
      });
    }
  });
}
