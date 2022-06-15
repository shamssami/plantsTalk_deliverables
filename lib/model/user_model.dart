import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? city;
  String? username;
  String? password;
  String? profile;
  //String? Confirm_Password;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
    this.city,
    this.username,
    this.password,
    this.profile,
    //this.Confirm_Password,

  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      city: map['city'],
      username : map['username'],
      password: map['password'],
      profile: map['profile']
     // Confirm_Password: map['Confirm_Password'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'city': city,
      'username': username,
      'password':password,
      'profile' : profile,
     // 'Confirm_Password"' : Confirm_Password,
    };
  }
}