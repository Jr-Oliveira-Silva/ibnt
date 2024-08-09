import 'package:app_ibnt/src/app_imports.dart';

import '../../../../../mocks/departments/departments_repository_mock.dart';

void main() {
  late IDepartmentsRepository repository;
  late CreateDepartmentBloc bloc;

  group(
    'CreateDepartmentBloc should',
    () {
      setUp(
        () {
          repository = DepartmentsRepositoryMock();
          bloc = CreateDepartmentBloc(repository);
        },
      );
      blocTest<CreateDepartmentBloc, CreateDepartmentStates>(
        'emit a CreateDepartmentFailureState',
        setUp: () {
          when(() => repository.createDepartment(DepartmentMockValues.department)).thenAnswer((_) async => (
                CreateDepartmentException(exception: "Error"),
                null,
              ));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(CreateDepartmentEvent(DepartmentMockValues.department)),
        expect: () => [
          isA<CreateDepartmentLoadingState>(),
          isA<CreateDepartmentFailureState>(),
        ],
      );
      blocTest<CreateDepartmentBloc, CreateDepartmentStates>(
        'emit a CreateDepartmentSuccessState',
        setUp: () {
          when(() => repository.createDepartment(DepartmentMockValues.department)).thenAnswer((_) async => (
                null,
                DepartmentMockValues.department,
              ));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(CreateDepartmentEvent(DepartmentMockValues.department)),
        expect: () => [
          isA<CreateDepartmentLoadingState>(),
          isA<CreateDepartmentSuccessState>(),
        ],
      );
    },
  );
}
