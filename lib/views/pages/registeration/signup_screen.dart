import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plants_talk/services/resources/auth_methods.dart';
import 'package:plants_talk/responsive/mobile_screen_layout.dart';
import 'package:plants_talk/responsive/responsive_layout.dart';
import 'package:plants_talk/responsive/web_screen_layout.dart';
import 'package:plants_talk/views/pages/registeration/login_screen.dart';
import 'package:plants_talk/utils/colors.dart';
import 'package:plants_talk/utils/utils.dart';
import 'package:plants_talk/views/widgets/GetStartedPage.dart';
import 'package:plants_talk/views/widgets/text_field_input.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _secondnameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _firstnameController.dispose();
    _secondnameController.dispose();
    _cityController.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        firstname: _firstnameController.text,
        secondname: _secondnameController.text,
        city: _cityController.text,
        file: _image!);
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GetStartedPage()));
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
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
          const Locale('en', 'EN'), // English, no country code
          // Locale('es', ''), // Spanish, no country code
        ],
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              // padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Flexible(
                  //   child: Container(),
                  //   flex: 2,
                  // ),
                  Expanded(
                      child: Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_image!),
                              backgroundColor: Color(0xFF00695C),
                            )
                          : const CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  'https://i.stack.imgur.com/l60Hf.png'),
                            ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(Icons.add_a_photo),
                        ),
                      )
                    ],
                  )),

                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: TextFieldInput(
                    hintText: 'ادخل اسمك',
                    textInputType: TextInputType.text,
                    textEditingController: _usernameController,
                  )),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: TextFieldInput(
                    hintText: 'ادخل بريدك الالكتروني',
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _emailController,
                  )),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: TextFieldInput(
                    hintText: 'ادخل كلمة السر',
                    textInputType: TextInputType.text,
                    textEditingController: _passwordController,
                    isPass: true,
                  )),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: TextFieldInput(
                    hintText: 'ادخل اسمك الاول',
                    textInputType: TextInputType.text,
                    textEditingController: _firstnameController,
                  )),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: TextFieldInput(
                    hintText: 'ادخل اسم العيلة ',
                    textInputType: TextInputType.text,
                    textEditingController: _secondnameController,
                  )),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: TextFieldInput(
                    hintText: 'ادخل مدينتك',
                    textInputType: TextInputType.text,
                    textEditingController: _cityController,
                  )),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: InkWell(
                    child: Container(
                      child: !_isLoading
                          ? const Text(
                              'انشاء حساب',
                              style: TextStyle(color: Colors.white),
                            )
                          : const CircularProgressIndicator(
                              color: primaryColor,
                            ),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        color: const Color(0xFF00695C),
                      ),
                    ),
                    onTap: signUpUser,
                  )),
                  const SizedBox(
                    height: 3,
                  ),
                  // Flexible(
                  //   child: Container(),
                  //   flex: 2,
                  // ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text(
                          'هل لديك حساب؟ ',
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        ),
                        child: Container(
                          child: const Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF00695C),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
