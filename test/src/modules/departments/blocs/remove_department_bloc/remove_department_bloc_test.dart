import 'package:app_ibnt/src/app_imports.dart';

import '../../../../../mocks/departments/departments_repository_mock.dart';

void main() {
  late IDepartmentsRepository repository;
  late RemoveDepartmentBloc bloc;

  group(
    'RemoveDepartmentBloc should',
    () {
      setUp(
        () {
          repository = DepartmentsRepositoryMock();
          bloc = RemoveDepartmentBloc(repository);
        },
      );
      blocTest<RemoveDepartmentBloc, RemoveDepartmentStates>(
        'emit a RemoveDepartmentFailureState',
        setUp: () {
          when(() => repository.removeDepartment(DepartmentMockValues.department)).thenAnswer((_) async => (
                RemoveDepartmentException(exception: "Error"),
                null,
              ));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(RemoveDepartmentEvent(DepartmentMockValues.department)),
        expect: () => [
          isA<RemoveDepartmentLoadingState>(),
          isA<RemoveDepartmentFailureState>(),
        ],
      );
      blocTest<RemoveDepartmentBloc, RemoveDepartmentStates>(
        'emit a RemoveDepartmentSuccessState',
        setUp: () {
          when(() => repository.removeDepartment(DepartmentMockValues.department)).thenAnswer((_) async => (null, null));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(RemoveDepartmentEvent(DepartmentMockValues.department)),
        expect: () => [
          isA<RemoveDepartmentLoadingState>(),
          isA<RemoveDepartmentSuccessState>(),
        ],
      );
    },
  );
}
