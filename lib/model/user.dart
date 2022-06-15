import 'package:cloud_firestore/cloud_firestore.dart';

class User2 {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String firstname;
  final String secondname;
  final String city;

  const User2(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.firstname,
      required this.secondname,
      required this.city});

  static User2 fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User2(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      firstname: snapshot["firstname"],
      secondname: snapshot["secondname"],
      city: snapshot["city"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "firstname": firstname,
        "secondname": secondname,
        "city": city,
      };
}
