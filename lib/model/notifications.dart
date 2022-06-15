import 'dart:io';

class Notifications {
  String uid;
  String? title;
  String? body;
  DateTime? dateTime;
  Notifications({this.title, this.body, this.dateTime, required this.uid});

  // receiving data from server
  factory Notifications.fromMap(map) {
    return Notifications(
        uid: map['uid'],
        title: map['title'],
        body: map['body'],
        dateTime: map['dateTime']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'title': title, 'body': body, 'dateTime': dateTime};
  }
}
