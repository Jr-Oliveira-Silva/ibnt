import 'package:app_ibnt/src/modules/home/home_imports.dart';

abstract class HomeException extends AppException {
  final String exception;
  HomeException({required this.exception}) : super(exception: exception);
}

class TimeLineException extends HomeException {
  TimeLineException({required super.exception});
}

class UserException extends HomeException {
  UserException({required super.exception});
}

class CreateEventException extends HomeException {
  CreateEventException({required super.exception});
}

class ReactionException extends HomeException {
  ReactionException({required super.exception});
}

class EventsReactionsListException extends HomeException {
  EventsReactionsListException({required super.exception});
}

class BibleMessagesReactionsListException extends HomeException {
  BibleMessagesReactionsListException({required super.exception});
}

class UpdateReactionException extends HomeException {
  UpdateReactionException({required super.exception});
}
class RemoveReactionException extends HomeException {
  RemoveReactionException({required super.exception});
}
