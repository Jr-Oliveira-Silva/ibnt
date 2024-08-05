import 'package:app_ibnt/src/app_imports.dart';
import '../../../../../mocks/home/home_repository_mock.dart';

void main() {
  late IHomeRepository repository;
  late CreateEventBloc bloc;

  group(
    'CreateEvent should',
    () {
      setUp(
        () {
          repository = HomeRepositoryMock();
          bloc = CreateEventBloc(repository);
        },
      );
      final newEvent = EventEntity();
      final event = EventEntity(
        id: 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
        title: 'EVENT TITLE',
        description: 'EVENT DESCRIPTION',
        date: '08-08-2024',
        postDate: '08-08-2024',
        imageField: XFile("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg"),
        type: EntityType.event,
      );
      blocTest<CreateEventBloc, CreateEventStates>(
        'emit a CreateEventFailureState',
        setUp: () {
          when(() => repository.createEvent(newEvent)).thenAnswer(
            (_) async => (CreateEventException(exception: "exception"), null),
          );
        },
        build: () => bloc,
        act: (bloc) {
          bloc.add(CreateEventEvent(newEvent));
        },
        expect: () => [
          isA<CreateEventLoadingState>(),
          isA<CreateEventFailureState>(),
        ],
      );

      blocTest<CreateEventBloc, CreateEventStates>(
        'emit a CreateEventSuccessState',
        setUp: () {
          when(() => repository.createEvent(event)).thenAnswer(
            (_) async => (
              null,
              EventEntity(
                id: 'dc32c7cf-5629-4e4e-65e5-08dcaaa89a10',
                title: 'EVENT TITLE',
                description: 'EVENT DESCRIPTION',
                date: '08-08-2024',
                postDate: '08-08-2024',
                imageField: XFile("C:\\Users\\DELL\\Downloads\\IBNT_Screen_1.jpeg"),
                type: EntityType.event,
              )
            ),
          );
        },
        build: () => bloc,
        act: (bloc) {
          bloc.add(CreateEventEvent(event));
        },
        expect: () => [
          isA<CreateEventLoadingState>(),
          isA<CreateEventSuccessState>(),
        ],
      );
    },
  );
}
