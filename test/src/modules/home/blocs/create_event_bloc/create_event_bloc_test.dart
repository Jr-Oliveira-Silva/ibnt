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
          when(() => repository.createEvent(HomeMockValues.eventEntity)).thenAnswer(
            (_) async => (
              null,
              HomeMockValues.eventEntity,
            ),
          );
        },
        build: () => bloc,
        act: (bloc) {
          bloc.add(CreateEventEvent(HomeMockValues.eventEntity));
        },
        expect: () => [
          isA<CreateEventLoadingState>(),
          isA<CreateEventSuccessState>(),
        ],
      );
    },
  );
}
