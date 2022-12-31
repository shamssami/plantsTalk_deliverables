import 'package:flutter/material.dart';
import 'package:plants_talk/services/resources/auth_methods.dart';
import 'package:plants_talk/views/widgets/BottomAppBar.dart';
import 'package:plants_talk/views/pages/registeration/resetPassword.dart';
import 'package:plants_talk/views/pages/registeration/signup_screen.dart';
import 'package:plants_talk/utils/utils.dart';
import 'package:plants_talk/views/widgets/text_field_input.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TabsDemoScreen()));
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
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
              SizedBox(
                height: 60,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 180,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "PlantsTalk",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 2, 124, 110),
                      fontSize: 30,
                      fontFamily: 'Varela',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFieldInput(
                            key: Key('email'),
                            hintText: 'ادخل بريدك الالكتروني',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _emailController,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFieldInput(
                            key: Key('pass'),
                            hintText: 'ادخل كلمة السر',
                            textInputType: TextInputType.text,
                            textEditingController: _passwordController,
                            isPass: true,
                          ),

                          const SizedBox(
                            height: 35,
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.teal.shade700,
                            child: MaterialButton(
                                key: Key('login'),
                                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () {
                                  loginUser();
                                },
                                child: const Text(
                                  "تسجيل الدخول",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "هل نسيت كلمة المرور؟ ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                reset())); //////
                                  },
                                  child: Text(
                                    "اضغط هنا",
                                    style: TextStyle(
                                        color: Colors.teal.shade700,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ]),

                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              " ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "لا حساب لديك؟ ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen()));
                                  },
                                  child: Text(
                                    "انشاء حساب",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.teal.shade700,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ])
                        ]),
                  ))
            ],
          ))),
        ));
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.1, size.height - 50);
    path.lineTo(size.width * 0.9, size.height - 50);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
