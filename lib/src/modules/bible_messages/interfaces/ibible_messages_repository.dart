import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

abstract class IBibleMessagesRepository {
  Future<Either<BibleMessageException, BibleMessageEntity>> createBibleMessage(NewMessageEntity message);
  Future<Either<BibleMessageException, BibleMessageEntity>> generateBibleMessage(NewMessageEntity message);
  Future<Either<BibleMessageException, List<BibleMessageEntity>>> getMemberMessages(String memberId);
  Future<Either<BibleMessageException, BibleMessageEntity>> updateBibleMessage(BibleMessageEntity message);
  Future<(BibleMessageException?, void)> postBibleMessageInTimeline(BibleMessageEntity message);
}
