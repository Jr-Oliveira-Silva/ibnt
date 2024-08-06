import 'package:app_ibnt/src/app_imports.dart';
import '../../../../../mocks/home/home_repository_mock.dart';

void main() {
  late IHomeRepository repository;
  late GetEventsBloc bloc;

  setUp(
    () {
      repository = HomeRepositoryMock();
      bloc = GetEventsBloc(repository);
    },
  );
  group(
    'GetEvents should',
    () {
      blocTest<GetEventsBloc, GetEventsStates>(
        'emits GetEventsFailureState',
        setUp: () {
          when(() => repository.getEvents()).thenAnswer((invocation) async => (
                GetEventsException(exception: "Mensagem de erro"),
                <EventEntity>[],
              ));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetEventsEvent()),
        expect: () => [
          isA<GetEventsLoadingState>(),
          isA<GetEventsFailureState>(),
        ],
      );
      blocTest<GetEventsBloc, GetEventsStates>(
        'emits GetEventsSuccessState',
        setUp: () {
          when(() => repository.getEvents()).thenAnswer((invocation) async => (
                null,
                HomeMockValues.eventsList,
              ));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetEventsEvent()),
        expect: () => [
          isA<GetEventsLoadingState>(),
          isA<GetEventsSuccessState>(),
        ],
      );
    },
  );
}
