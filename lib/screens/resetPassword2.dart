import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plants_talk/resources/auth_methods.dart';
import 'package:plants_talk/responsive/mobile_screen_layout.dart';
import 'package:plants_talk/responsive/responsive_layout.dart';
import 'package:plants_talk/responsive/web_screen_layout.dart';
import 'package:plants_talk/screens/Profile.dart';
import 'package:plants_talk/screens/login_screen22.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_talk/screens/signup_screen.dart';
import 'package:plants_talk/utils/colors.dart';
import 'package:plants_talk/utils/global_variable.dart';
import 'package:plants_talk/utils/utils.dart';

import 'package:plants_talk/widgets/text_field_input.dart';

class reset extends StatefulWidget {
  const reset({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<reset> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? errorMessage;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void resetpassword(
    String email,
  ) async {
    try {
      await auth
          .sendPasswordResetEmail(email: _emailController.text)
          // .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(
                    msg: "تم ارسال الطلب", textColor: Colors.green),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen())),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          body: SingleChildScrollView(
              child: Container(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack(
              //  children: [
              //ClipPath(
              //  clipper: DrawClip(),
              SizedBox(
                height: 60,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 250,
                  //  fit:BoxFit.fill
                ),
                //   ),
                //  ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Text(
                  "اعادة تعيين كلمة المرور",
                  style: TextStyle(
                      color: Colors.teal.shade800,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
// //email
              Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    //  key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFieldInput(
                            hintText: 'ادخل بريدك الالكتروني',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _emailController,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.teal.shade700,
                            child: MaterialButton(
                                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () {
                                  resetpassword(_emailController.text);
                                },
                                child: Text(
                                  "ارسال",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(height: 120),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Icon(Icons.navigate_before),
                                  Text(
                                    "رجوع",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ))
            ],
          ))),
        ));
  }
}
