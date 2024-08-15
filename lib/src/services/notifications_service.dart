// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  NotificationsService();
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> _handleBackgroundNotification(RemoteMessage message) async {
    String memberId = "";
    final preferences = await SharedPreferences.getInstance();
    final userJson = preferences.getString("user");
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      memberId = userMap["id"];
    }
    Modular.to.navigate("/auth/home/bible_messages/$memberId");
  }

  static Future<void> initializeNotifications() async {
    _firebaseMessaging.setAutoInitEnabled(true);
    await _firebaseMessaging.subscribeToTopic("bible_messages");

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      await _handleBackgroundNotification(initialMessage);
    }
    await _firebaseMessaging.requestPermission(provisional: true);
    final fcmToken = await _firebaseMessaging.getToken();
    log("DEVICE NOTIFICATIONS TOKEN: $fcmToken");

    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundNotification);
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundNotification);
  }

  static Future<void> initLocalNotifications() async {
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings(
      "@mipmap/ic_launcher",
    );
    InitializationSettings initializationSettings = const InitializationSettings(
      android: androidInitializationSettings,
    );

    _notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: notificationTap,
      onDidReceiveBackgroundNotificationResponse: notificationTap,
    );
  }

  static void notificationTap(NotificationResponse notificationResponse) async {
    String memberId = "";
    final preferences = await SharedPreferences.getInstance();
    final userJson = preferences.getString("user");
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      memberId = userMap["id"];
    }
    Modular.to.navigate("/auth/home/bible_messages/$memberId");
  }
}
