import 'package:app_ibnt/src/app_imports.dart';

import '../../../../../mocks/departments/departments_repository_mock.dart';

void main() {
  late IDepartmentsRepository repository;
  late RemoveMemberFromDepartmentBloc bloc;

  group(
    'RemoveMemberFromDepartmentBloc should',
    () {
      setUp(
        () {
          repository = DepartmentsRepositoryMock();
          bloc = RemoveMemberFromDepartmentBloc(repository);
        },
      );
      blocTest<RemoveMemberFromDepartmentBloc, RemoveMemberFromDepartmentStates>(
        'emit a RemoveMemberFromDepartmentFailureState',
        setUp: () {
          when(() => repository.removeMemberFromDepartment(DepartmentMockValues.department,DepartmentMockValues.member)).thenAnswer((_) async => (
                RemoveMemberException(exception: "Error"),
                null,
              ));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(RemoveMemberFromDepartmentEvent(DepartmentMockValues.department,DepartmentMockValues.member)),
        expect: () => [
          isA<RemoveMemberFromDepartmentLoadingState>(),
          isA<RemoveMemberFromDepartmentFailureState>(),
        ],
      );
      blocTest<RemoveMemberFromDepartmentBloc, RemoveMemberFromDepartmentStates>(
        'emit a RemoveMemberFromDepartmentSuccessState',
        setUp: () {
          when(() => repository.removeMemberFromDepartment(DepartmentMockValues.department, DepartmentMockValues.member)).thenAnswer((_) async => (null, null));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(RemoveMemberFromDepartmentEvent(DepartmentMockValues.department,DepartmentMockValues.member)),
        expect: () => [
          isA<RemoveMemberFromDepartmentLoadingState>(),
          isA<RemoveMemberFromDepartmentSuccessState>(),
        ],
      );
    },
  );
}
