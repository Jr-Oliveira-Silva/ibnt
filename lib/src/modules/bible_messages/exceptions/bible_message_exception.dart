import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleMessageException extends AppException {
  BibleMessageException({required this.exception}) : super(exception: exception);

  final String exception;
}

class GetBookChapterException extends BibleMessageException {
  GetBookChapterException({required super.exception});
}

class GetBookVerseException extends BibleMessageException {
  GetBookVerseException({required super.exception});
}

class ComposeMessageContentException extends BibleMessageException {
  ComposeMessageContentException({required super.exception});
}

class CreateMessageException extends BibleMessageException {
  CreateMessageException({required super.exception});
}

class GenerateMessageException extends BibleMessageException {
  GenerateMessageException({required super.exception});
}

class GetMessagesException extends BibleMessageException {
  GetMessagesException({required super.exception});
}

class UpdateMessageException extends BibleMessageException {
  UpdateMessageException({required super.exception});
}

class PostMessageToTimelineException extends BibleMessageException {
  PostMessageToTimelineException({required super.exception});
}
