import 'package:app_ibnt/src/app_imports.dart';

import '../../../../../mocks/home/home_repository_mock.dart';

void main() {
  late IHomeRepository repository;
  late CommonEventBloc bloc;

  group(
    'CreateEvent should',
    () {
      setUp(
        () {
          repository = HomeRepositoryMock();
          bloc = CommonEventBloc(repository);
        },
      );

      blocTest<CommonEventBloc, CommonEventStates>(
        'emit a EventFailureState',
        setUp: () {
          when(() => repository.deleteEvent(HomeMockValues.eventEntity.id!)).thenAnswer(
            (_) async => (DeleteEventException(exception: "exception"), null),
          );
        },
        build: () => bloc,
        act: (bloc) => bloc.add(DeleteCommonEventEvent(HomeMockValues.eventEntity)),
        expect: () => [
          isA<EventLoadingState>(),
          isA<EventFailureState>(),
        ],
      );

      blocTest<CommonEventBloc, CommonEventStates>(
        'emit a DeleteEventSuccessState',
        setUp: () {
          when(() => repository.deleteEvent(HomeMockValues.eventEntity.id!)).thenAnswer(
            (_) async => (null, null),
          );
        },
        build: () => bloc,
        act: (bloc) => bloc.add(DeleteCommonEventEvent(HomeMockValues.eventEntity)),
        expect: () => [
          isA<EventLoadingState>(),
          isA<DeleteEventSuccessState>(),
        ],
      );
    },
  );
}
