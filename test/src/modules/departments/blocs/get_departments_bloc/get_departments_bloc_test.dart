import 'package:app_ibnt/src/app_imports.dart';

import '../../../../../mocks/departments/departments_repository_mock.dart';

void main() {
  late IDepartmentsRepository repository;
  late GetDepartmentsBloc bloc;

  group(
    'GetDepartmentsBloc should',
    () {
      setUp(
        () {
          repository = DepartmentsRepositoryMock();
          bloc = GetDepartmentsBloc(repository);
        },
      );
      blocTest<GetDepartmentsBloc, GetDepartmentsStates>(
        'emit a GetDepartmentsFailureState',
        setUp: () {
          when(() => repository.getDepartments()).thenAnswer((_) async => (
                GetDepartmentsException(exception: "Error"),
                null,
              ));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetDepartmentsEvent()),
        expect: () => [
          isA<GetDepartmentsLoadingState>(),
          isA<GetDepartmentsFailureState>(),
        ],
      );
      blocTest<GetDepartmentsBloc, GetDepartmentsStates>(
        'emit a GetDepartmentsSuccessState',
        setUp: () {
          when(() => repository.getDepartments()).thenAnswer((_) async => (
                null,
                [
                  DepartmentMockValues.department,
                  DepartmentMockValues.department,
                ],
              ));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetDepartmentsEvent()),
        expect: () => [
          isA<GetDepartmentsLoadingState>(),
          isA<GetDepartmentsSuccessState>(),
        ],
      );
    },
  );
}
