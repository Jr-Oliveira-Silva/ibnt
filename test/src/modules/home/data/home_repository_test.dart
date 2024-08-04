import 'package:app_ibnt/src/app_imports.dart';

void main() {
  late AppClient client;
  late HomeRepository repository;

  setUp(
    () {
      client = AppHttpClientMock();
      repository = HomeRepository(client);
    },
  );

  group(
    'CreateEvent should',
    () {
      test(
        'fail to post a new event in api, and return a CreateEventException.',
        () async {
          final imageField = File("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg");
          final event = EventEntity(
            title: "Event Title",
            description: "Event Description",
            date: "08-08-2024",
            postDate: "08-08-2024",
            imageField: imageField,
          );

          final eventMap = event.toMap();

          eventMap.remove('imageField');

          when(() => client.post(
                "$API_URL/events",
                eventMap,
                headers: {
                  "content-type": "application/json",
                  "authorization": "Bearer $user_token",
                },
              )).thenAnswer((_) async => Response("A propriedade postDate não pode ser vazia ou nula.", 400));

          final (exception, createdEvent) = await repository.createEvent(event);

          expect(createdEvent == null, equals(true));
          expect(exception != null, equals(true));
          expect(exception, isA<CreateEventException>());
          expect(exception?.exception, equals("A propriedade postDate não pode ser vazia ou nula."));
        },
      );

      test(
        'post a new Event in API and return a new EventEntity successfully.',
        () async {
          const setImageUrl = "$API_URL/events/images/dc32c7cf-5629-4e4e-65e5-08dcaaa89a10";
          final imageField = File("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg");

          final event = EventEntity(
            title: "Event Title",
            description: "Event Description",
            date: "08-08-2024",
            postDate: "08-08-2024",
            imageField: imageField,
          );

          final eventMap = event.toMap();

          eventMap.remove('imageField');

          final eventJson = jsonEncode(
            {
              'id': 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
              'title': 'Dart Map Example',
              'postDate': '2024-08-03',
              'date': '2024-08-01',
              'description': 'This is an example of creating and filling a Dart map.',
            },
          );

          when(() => client.post(
                "$API_URL/events",
                eventMap,
                headers: {
                  "content-type": "application/json",
                  "authorization": "Bearer $user_token",
                },
              )).thenAnswer((_) async => Response(eventJson, 201));

          when(() => client.formDataHandler(
                imageField,
                'imageFile',
                setImageUrl,
                'POST',
                headers: {"authorization": "Bearer $user_token"},
              )).thenAnswer((_) async => StreamedResponse(Stream.value(utf8.encode(eventJson).toList()), HttpStatus.ok));

          final (exception, createdEvent) = await repository.createEvent(event);

          expect(createdEvent != null, equals(true));
          expect(exception == null, equals(true));
          expect(createdEvent, isA<EventEntity>());
          expect(createdEvent?.id != null, equals(true));
        },
      );
    },
  );

  group(
    'SetEventImage should',
    () {
      test(
        'fail to set an image file as an event image and return a SetEventImageException.',
        () async {
          const setImageUrl = "$API_URL/events/images/dc32c7cf-5629-4e4e-65e5-08dcaaa89a10";

          final imageField = File("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg");

          when(() => client.formDataHandler(
                imageField,
                'imageFile',
                setImageUrl,
                'POST',
                headers: {"authorization": "Bearer $user_token"},
              )).thenAnswer(
            (_) async => StreamedResponse(Stream.value(utf8.encode(jsonEncode({"error": "error message"})).toList()), HttpStatus.badRequest),
          );

          final (exception, eventWithImage) = await repository.setEventImage(imageField, 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10');

          expect(eventWithImage == null, equals(true));
          expect(exception != null, equals(true));
          expect(exception, isA<SetEventImageException>());
        },
      );

      test(
        'set an image file as an event image based on a created Event and return a EventEntity successfully.',
        () async {
          const setImageUrl = "$API_URL/events/images/dc32c7cf-5629-4e4e-65e5-08dcaaa89a10";
          final imageField = File("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg");

          final eventJson = jsonEncode(
            {
              'id': 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
              'title': 'Dart Map Example',
              'postDate': '2024-08-03',
              'date': '2024-08-01',
              'imageUrl': 'Images/dc32c7cf-5629-4e4e-65e5-08dcaaa89a10IBNT_Screen_1.jpeg',
              'description': 'This is an example of creating and filling a Dart map.',
              'reactions': []
            },
          );

          when(() => client.formDataHandler(
                imageField,
                'imageFile',
                setImageUrl,
                'POST',
                headers: {"authorization": "Bearer $user_token"},
              )).thenAnswer(
            (_) async => StreamedResponse(Stream.value(utf8.encode(eventJson).toList()), HttpStatus.ok),
          );

          final (exception, eventWithImage) = await repository.setEventImage(imageField, 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10');

          expect(eventWithImage != null, equals(true));
          expect(exception == null, equals(true));
          expect(eventWithImage, isA<EventEntity>());
          expect(eventWithImage?.id != null, equals(true));
        },
      );
    },
  );
}
