import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:plants_talk/model/notifications.dart';

class NotificationService {
  final String uid;
  NotificationService({required this.uid});
  final CollectionReference diseaseCollection =
      FirebaseFirestore.instance.collection('notifications');

  Future saveNotification(String title, String body, DateTime dateTime) async {
    return await diseaseCollection
        .doc()
        .set({'title': title, 'body': body, 'dateTime': dateTime, 'uid': uid});
  }

  Future getNotifications() async {
    List notifications = [];

    try {
      await diseaseCollection.get().then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          notifications.add(element.data());
        });
      });
      return notifications;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  List<Notifications> _notificationsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Notifications(
          title: doc.get('title') ?? '',
          body: doc.get('body') ?? '',
          uid: doc.get('uid') ?? '',
          dateTime: doc.get('dateTime') ?? 0);
    }).toList();
  }

  Stream<List<Notifications>> get diseases {
    return diseaseCollection.snapshots().map(_notificationsListFromSnapshot);
  }
}
