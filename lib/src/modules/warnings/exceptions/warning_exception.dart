import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

class WarningException extends AppException {
  WarningException({required this.exception}) : super(exception: exception);

  final String exception;
}

class CreateAnnouncementException extends WarningException {
  CreateAnnouncementException({required super.exception});
}

class GetAnnouncementsException extends WarningException {
  GetAnnouncementsException({required super.exception});
}

class DeleteAnnouncementException extends WarningException {
  DeleteAnnouncementException({required super.exception});
}
