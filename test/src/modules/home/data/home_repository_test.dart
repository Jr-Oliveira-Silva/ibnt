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
    () {},
  );
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
          )).thenAnswer((_) async => Response(
            "A propriedade postDate não pode ser vazia ou nula.",
            400,
            headers: {
              "content-type": "application/json",
              "authorization": "Bearer $user_token",
            },
          ));

      final (exception, createdEvent) = await repository.createEvent(event);

      expect(createdEvent == null, equals(true));
      expect(exception != null, equals(true));
      expect(exception, isA<CreateEventException>());
      expect(exception?.exception, equals("A propriedade postDate não pode ser vazia ou nula."));
    },
  );

  test(
    '',
    () async {},
  );
}
