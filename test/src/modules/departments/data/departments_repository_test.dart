import 'package:app_ibnt/src/app_imports.dart';

void main() {
  late AppClient client;
  late DepartmentsRepository repository;

  setUp(
    () {
      client = AppHttpClientMock();
      repository = DepartmentsRepository(client);
    },
  );

  group('CreateDepartment should', () {
    test(
      'return a CreateDepartmentException as a failure result.',
      () async {
        final departmentMap = DepartmentMockValues.department.createMap();

        when(() => client.post(
              "$API_URL/departments",
              body: departmentMap,
              headers: {
                "content-type": "application/json",
                "authorization": "Bearer $user_token",
              },
            )).thenAnswer((_) async => Response("SERVER error message.", 400));

        final (exception, createdDepartment) = await repository.createDepartment(DepartmentMockValues.department);

        expect(createdDepartment == null, equals(true));
        expect(exception != null, equals(true));
        expect(exception, isA<CreateDepartmentException>());
        expect(exception?.exception, equals("SERVER error message."));
      },
    );
    test(
      'return a DepartmentEntity populated with respective data.',
      () async {
        final departmentMap = DepartmentMockValues.department.createMap();

        when(() => client.post(
              "$API_URL/departments",
              body: departmentMap,
              headers: {
                "content-type": "application/json",
                "authorization": "Bearer $user_token",
              },
            )).thenAnswer((_) async => Response(DepartmentMockValues.departmentJson, 201));

        final (exception, createdDepartment) = await repository.createDepartment(DepartmentMockValues.department);

        expect(exception == null, equals(true));
        expect(createdDepartment != null, equals(true));
        expect(createdDepartment, isA<DepartmentEntity>());
        expect(createdDepartment!.id != null, equals(true));
        expect(createdDepartment.members!.length, equals(3));
      },
    );
  });
  group('GetDepartments should', () {
    test(
      'return a GetDepartmentsException as failure result.',
      () async {
        when(() => client.get(
              "$API_URL/departments",
              headers: {
                "content-type": "application/json",
                "authorization": "Bearer $user_token",
              },
            )).thenAnswer((_) async => Response("SERVER error message.", 404));

        final (exception, departments) = await repository.getDepartments();

        expect(departments == null, equals(true));
        expect(exception != null, equals(true));
        expect(exception, isA<GetDepartmentsException>());
        expect(exception?.exception, equals("SERVER error message."));
      },
    );
    test(
      'return a List<DepartmentEntity>',
      () async {
        when(() => client.get(
              "$API_URL/departments",
              headers: {
                "content-type": "application/json",
                "authorization": "Bearer $user_token",
              },
            )).thenAnswer((_) async => Response(DepartmentMockValues.departmentsJsonList, 200));

        final (exception, departments) = await repository.getDepartments();

        expect(exception == null, equals(true));
        expect(departments != null, equals(true));
        expect(departments, isA<List<DepartmentEntity>>());
        expect(departments!.isNotEmpty, equals(true));
      },
    );
  });
  group('RemoveDepartment should', () {
    test(
      'return a RemoveDepartmentException as failure result.',
      () async {
        when(() => client.delete(
              "$API_URL/departments/89as8fg23ajsdfhkasjdhf94823",
              headers: {
                "content-type": "application/json",
                "authorization": "Bearer $user_token",
              },
            )).thenAnswer((_) async => Response("SERVER error message.", 400));

        final (exception, _) = await repository.removeDepartment(DepartmentMockValues.department);

        expect(exception != null, equals(true));
        expect(exception, isA<RemoveDepartmentException>());
        expect(exception?.exception, equals("SERVER error message."));
      },
    );
    test(
      'return null value for exception.',
      () async {
        when(() => client.delete(
              "$API_URL/departments/89as8fg23ajsdfhkasjdhf94823",
              headers: {
                "content-type": "application/json",
                "authorization": "Bearer $user_token",
              },
            )).thenAnswer((_) async => Response("SERVER error message.", 204));

        final (exception, _) = await repository.removeDepartment(DepartmentMockValues.department);

        expect(exception == null, equals(true));
      },
    );
  });

  group('RemoveMemberFromDepartment should', () {
    test(
      'return a RemoveMemberException as failure result.',
      () async {
        when(() => client.delete(
              "$API_URL/departments/members/89as8fg23ajsdfhkasjdhf94823/aksj3k4j52ljhalkh98ASDF234kj",
              headers: {
                "content-type": "application/json",
                "authorization": "Bearer $user_token",
              },
            )).thenAnswer((_) async => Response("SERVER error message.", 400));

        final (exception, _) = await repository.removeMemberFromDepartment(DepartmentMockValues.department, DepartmentMockValues.member);

        expect(exception != null, equals(true));
        expect(exception, isA<RemoveMemberException>());
        expect(exception?.exception, equals("SERVER error message."));
      },
    );
    test(
      'return null value for exception.',
      () async {
        when(() => client.delete(
              "$API_URL/departments/members/89as8fg23ajsdfhkasjdhf94823/aksj3k4j52ljhalkh98ASDF234kj",
              headers: {
                "content-type": "application/json",
                "authorization": "Bearer $user_token",
              },
            )).thenAnswer((_) async => Response("SERVER error message.", 200));

        final (exception, _) = await repository.removeMemberFromDepartment(DepartmentMockValues.department, DepartmentMockValues.member);

        expect(exception == null, equals(true));
      },
    );
  });
}
