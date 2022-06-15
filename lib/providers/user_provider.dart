import 'package:flutter/widgets.dart';
import 'package:plants_talk/resources/auth_methods.dart';

import 'package:plants_talk/model/user.dart';

class UserProvider with ChangeNotifier {
  User2? _user;
  final AuthMethods _authMethods = AuthMethods();

  User2? get getUser => _user;

  Future<void> refreshUser() async {
    User2 user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
