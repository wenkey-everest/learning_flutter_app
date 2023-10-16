import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initializeNotification() {
    final DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
      defaultPresentAlert: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) => {},
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(iOS: darwinInitializationSettings);

    notificationsPlugin.initialize(initializationSettings);
  }

  notificationDetails() {
    return const NotificationDetails(iOS: DarwinNotificationDetails());
  }

  showNotification({int id = 0, String? title, String? body}) {
    return notificationsPlugin.show(id, title, body, notificationDetails());
  }
}
