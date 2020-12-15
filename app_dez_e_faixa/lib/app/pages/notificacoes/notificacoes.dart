import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notificacoes {
  FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  init() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    this.flutterLocalNotificationPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(String resultado, String times) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      "your channel",
      "channel name",
      "channel descrption",
      priority: Priority.max,
      importance: Importance.max,
    );
    // channel IOS
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: ,
      // macOS: ,
    );
    await this.flutterLocalNotificationPlugin.show(
          0,
          resultado,
          times,
          platformChannelSpecifics,
        );
  }

  Future<void> scheduleNotification(
      String resultado, String times, int tempo) async {
    var scheduleNotificationDateTime =
        DateTime.now().add(Duration(seconds: tempo));

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      "your channel",
      "channel name",
      "channel descrption",
      icon: "ic_launcher",
      priority: Priority.max,
      importance: Importance.max,
    );
    // channel IOS
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: ,
      // macOS: ,
    );

    this.flutterLocalNotificationPlugin.cancelAll();
    await this.flutterLocalNotificationPlugin.schedule(
          0,
          resultado,
          times,
          scheduleNotificationDateTime,
          platformChannelSpecifics,
        );
  }

  Future<void> showProgressNotification() async {
    const int maxProgress = 53;
    const BigTextStyleInformation bigTextStyleInformation =
        BigTextStyleInformation(
      "",
      htmlFormatBigText: true,
      contentTitle:
          'overridden <b>big</b> content title <button type="button">Click Me!</button>',
      htmlFormatContentTitle: true,
      summaryText: 'summary <i>text</i>',
      htmlFormatSummaryText: true,
    );
    for (int i = 0; i <= maxProgress; i++) {
      await Future<void>.delayed(const Duration(seconds: 1), () async {
        final AndroidNotificationDetails androidPlatformChannelSpecifics =
            AndroidNotificationDetails(
          'progress channel',
          'progress channel',
          'progress channel description',
          channelShowBadge: true,
          importance: Importance.max,
          priority: Priority.high,
          onlyAlertOnce: true,
          showProgress: true,
          maxProgress: maxProgress,
          progress: i,
          visibility: NotificationVisibility.public,
          styleInformation: bigTextStyleInformation,
          enableVibration: true,
        );
        final NotificationDetails platformChannelSpecifics =
            NotificationDetails(android: androidPlatformChannelSpecifics);
        await this.flutterLocalNotificationPlugin.show(
            0,
            'progress notification title',
            'progress notification body',
            platformChannelSpecifics,
            payload: 'item x');
      });
    }
  }
}
