import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:plants_talk/services/notifications-services.dart';

void sendNotification({String? title, String? body}) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final now = DateTime.now();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  const LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(
    defaultActionName: 'PlantsTalk',
  );
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      linux: initializationSettingsLinux);
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  ///
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_channel', 'High Importance Notification',
      description: "This channel is for important notification",
      importance: Importance.max);

  flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        channelAction: AndroidNotificationChannelAction.createIfNotExists,
      ),
    ),
  );

  await NotificationService(uid: FirebaseAuth.instance.currentUser!.uid)
      .saveNotification(title!, body!, now);
  print('__Notifications__');
}
