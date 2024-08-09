import 'package:app_ibnt/src/app_imports.dart';

abstract class DepartmentMockValues {
  static final department = DepartmentEntity(
    id: "89as8fg23ajsdfhkasjdhf94823",
    title: "TITLE",
    members: [],
  );

  static final departmentJson = jsonEncode({
    'id': "89as8fg23ajsdfhkasjdhf94823",
    'title': "TITLE",
    'members': [
      {
        'id': '8132498asdfahsiouh453i2uoqa',
        'fullName': 'User name',
        'profileImage': 'imageUrl',
      },
      {
        'id': '8132498asdfahsiouh453i2uoqa',
        'fullName': 'User name',
        'profileImage': 'imageUrl',
      },
      {
        'id': '8132498asdfahsiouh453i2uoqa',
        'fullName': 'User name',
        'profileImage': 'imageUrl',
      },
    ],
  });

  static final departmentsJsonList = jsonEncode([
    {
      'id': "89as8fg23ajsdfhkasjdhf94823",
      'title': "TITLE",
      'members': [
        {
          'id': '8132498asdfahsiouh453i2uoqa',
          'fullName': 'User name',
          'profileImage': 'imageUrl',
        },
        {
          'id': '8132498asdfahsiouh453i2uoqa',
          'fullName': 'User name',
          'profileImage': 'imageUrl',
        },
        {
          'id': '8132498asdfahsiouh453i2uoqa',
          'fullName': 'User name',
          'profileImage': 'imageUrl',
        },
      ],
    },
    {
      'id': "89as8fg23ajsdfhkasjdhf94823",
      'title': "TITLE",
      'members': [
        {
          'id': '8132498asdfahsiouh453i2uoqa',
          'fullName': 'User name',
          'profileImage': 'imageUrl',
        },
        {
          'id': '8132498asdfahsiouh453i2uoqa',
          'fullName': 'User name',
          'profileImage': 'imageUrl',
        },
        {
          'id': '8132498asdfahsiouh453i2uoqa',
          'fullName': 'User name',
          'profileImage': 'imageUrl',
        },
      ],
    },
    {
      'id': "89as8fg23ajsdfhkasjdhf94823",
      'title': "TITLE",
      'members': [
        {
          'id': '8132498asdfahsiouh453i2uoqa',
          'fullName': 'User name',
          'profileImage': 'imageUrl',
        },
        {
          'id': '8132498asdfahsiouh453i2uoqa',
          'fullName': 'User name',
          'profileImage': 'imageUrl',
        },
        {
          'id': '8132498asdfahsiouh453i2uoqa',
          'fullName': 'User name',
          'profileImage': 'imageUrl',
        },
      ],
    }
  ]);
}
