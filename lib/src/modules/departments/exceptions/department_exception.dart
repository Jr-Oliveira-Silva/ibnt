import 'package:app_ibnt/src/app_imports.dart';

abstract class DepartmentException extends AppException {
  DepartmentException({required this.exception}) : super(exception: exception);

  final String exception;
}

final class CreateDepartmentException extends DepartmentException {
  CreateDepartmentException({required super.exception});
}

final class GetDepartmentsException extends DepartmentException {
  GetDepartmentsException({required super.exception});
}

final class RemoveDepartmentException extends DepartmentException {
  RemoveDepartmentException({required super.exception});
}
