import 'package:app_ibnt/src/app_imports.dart';

class DepartmentsRepository implements IDepartmentsRepository {
  DepartmentsRepository(this._appClient);

  final AppClient _appClient;

  @override
  Future<(DepartmentException?, DepartmentEntity?)> createDepartment(DepartmentEntity department) async {
    try {
      final response = await _appClient.post("$API_URL/departments", body: department.createMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode != HttpStatus.created) {
        final message = response.body.toString();
        return (CreateDepartmentException(exception: message), null);
      } else {
        final createdDepartment = DepartmentEntity.fromMap(jsonDecode(response.body));
        return (null, createdDepartment);
      }
    } on DepartmentException catch (e) {
      return (CreateDepartmentException(exception: '$e'), null);
    } catch (e) {
      return (CreateDepartmentException(exception: '$e'), null);
    }
  }

  @override
  Future<(DepartmentException?, List<DepartmentEntity>?)> getDepartments() async {
    try {
      final response = await _appClient.get("$API_URL/departments", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode != HttpStatus.ok) {
        final message = response.body.toString();
        return (GetDepartmentsException(exception: message), null);
      } else {
        final serverJsonsList = jsonDecode(response.body) as List;
        final departments = serverJsonsList.map((department) => DepartmentEntity.fromMap(department)).toList();
        return (null, departments);
      }
    } on DepartmentException catch (e) {
      return (GetDepartmentsException(exception: '$e'), null);
    } catch (e) {
      return (GetDepartmentsException(exception: '$e'), null);
    }
  }

  @override
  Future<(DepartmentException?, void)> removeDepartment(DepartmentEntity department) async {
    try {
      final response = await _appClient.delete("$API_URL/departments/${department.id}", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode != HttpStatus.noContent) {
        final message = response.body.toString();
        return (RemoveDepartmentException(exception: message), null);
      } else {
        return (null, null);
      }
    } on DepartmentException catch (e) {
      return (RemoveDepartmentException(exception: '$e'), null);
    } catch (e) {
      return (RemoveDepartmentException(exception: '$e'), null);
    }
  }
}
