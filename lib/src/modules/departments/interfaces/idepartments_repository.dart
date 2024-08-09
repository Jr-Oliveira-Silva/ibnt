import 'package:app_ibnt/src/app_imports.dart';

abstract class IDepartmentsRepository {
  Future<(DepartmentException?, DepartmentEntity?)> createDepartment(DepartmentEntity department);
  Future<(DepartmentException?, List<DepartmentEntity>?)> getDepartments();
  Future<(DepartmentException?, void)> removeDepartment(DepartmentEntity department);
}
