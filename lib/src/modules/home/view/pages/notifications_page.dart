import 'package:app_ibnt/src/modules/home/home_imports.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.022;
    final fontSize = height * 0.02;
    final horizontalNotificationPadding = height * 0.015;
    final verticalNotificationPadding = height * 0.015;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Notificações",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: ListView(
          children: notifications.map((notification) {
            final notificationTitle = notification["title"] as String;
            final notificationContent = notification["content"] as String;
            final mapValue = notification["date"] as String;
            final notificationDate = mapValue.split(" ").first;
            final notificationHour = mapValue.split(" ").last;
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 0.3,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalNotificationPadding, vertical: verticalNotificationPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notificationTitle,
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          notificationHour,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.005),
                      child: Text(
                        notificationContent,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          notificationDate,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> notifications = [
  {
    "title": "Notification Title",
    "content": "This is the content of latests notifications. When shown in notifications page, their can be seen as list.",
    "date": "2024-25-04 07:23:00",
  },
  {
    "title": "Notification Title",
    "content": "This is the content of latests notifications. When shown in notifications page, their can be seen as list.",
    "date": "2024-25-04 07:23:00",
  },
  {
    "title": "Notification Title",
    "content": "This is the content of latests notifications. When shown in notifications page, their can be seen as list.",
    "date": "2024-25-04 07:23:00",
  },
  {
    "title": "Notification Title",
    "content": "This is the content of latests notifications. When shown in notifications page, their can be seen as list.",
    "date": "2024-25-04 07:23:00",
  },
  {
    "title": "Notification Title",
    "content": "This is the content of latests notifications. When shown in notifications page, their can be seen as list.",
    "date": "2024-25-04 07:23:00",
  },
  {
    "title": "Notification Title",
    "content": "This is the content of latests notifications. When shown in notifications page, their can be seen as list.",
    "date": "2024-25-04 07:23:00",
  }
];
