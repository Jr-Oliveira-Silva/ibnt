import 'package:app_ibnt/src/app_imports.dart';

abstract class HomeMockValues {
  static final imageField = XFile("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg");

  static final event = EventEntity(
    title: "Event Title",
    description: "Event Description",
    date: "08-08-2024",
    postDate: "08-08-2024",
    imageField: imageField,
  );

  static final eventEntity = EventEntity(
    id: 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
    title: 'EVENT TITLE',
    description: 'EVENT DESCRIPTION',
    date: '08-08-2024',
    postDate: '08-08-2024',
    imageField: XFile("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg"),
    type: EntityType.event,
  );

  static final eventJson = jsonEncode(
    {
      'id': 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
      'title': 'Dart Map Example',
      'postDate': '2024-08-03',
      'date': '2024-08-01',
      'imageUrl': 'Images/dc32c7cf-5629-4e4e-65e5-08dcaaa89a10IBNT_Screen_1.jpeg',
      'description': 'This is an example of creating and filling a Dart map.',
    },
  );

  static final eventsList = [
    EventEntity(
      id: 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
      title: 'EVENT TITLE',
      description: 'EVENT DESCRIPTION',
      date: '08-08-2024',
      postDate: '08-08-2024',
      imageField: XFile("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg"),
      type: EntityType.event,
    ),
    EventEntity(
      id: 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
      title: 'EVENT TITLE',
      description: 'EVENT DESCRIPTION',
      date: '08-08-2024',
      postDate: '08-08-2024',
      imageField: XFile("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg"),
      type: EntityType.event,
    ),
    EventEntity(
      id: 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
      title: 'EVENT TITLE',
      description: 'EVENT DESCRIPTION',
      date: '08-08-2024',
      postDate: '08-08-2024',
      imageField: XFile("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg"),
      type: EntityType.event,
    ),
    EventEntity(
      id: 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
      title: 'EVENT TITLE',
      description: 'EVENT DESCRIPTION',
      date: '08-08-2024',
      postDate: '08-08-2024',
      imageField: XFile("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg"),
      type: EntityType.event,
    ),
    EventEntity(
      id: 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
      title: 'EVENT TITLE',
      description: 'EVENT DESCRIPTION',
      date: '08-08-2024',
      postDate: '08-08-2024',
      imageField: XFile("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg"),
      type: EntityType.event,
    ),
  ];
  static final eventsJsonList = jsonEncode(
    [
      {
        'id': 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
        'title': 'Dart Map Example',
        'postDate': '2024-08-03',
        'date': '2024-08-01',
        'description': 'This is an example of creating and filling a Dart map.',
      },
      {
        'id': 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
        'title': 'Dart Map Example',
        'postDate': '2024-08-03',
        'date': '2024-08-01',
        'description': 'This is an example of creating and filling a Dart map.',
      },
      {
        'id': 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
        'title': 'Dart Map Example',
        'postDate': '2024-08-03',
        'date': '2024-08-01',
        'description': 'This is an example of creating and filling a Dart map.',
      },
      {
        'id': 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
        'title': 'Dart Map Example',
        'postDate': '2024-08-03',
        'date': '2024-08-01',
        'description': 'This is an example of creating and filling a Dart map.',
      },
    ],
  );
}
