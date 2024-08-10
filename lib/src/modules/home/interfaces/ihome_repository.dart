import 'package:app_ibnt/src/modules/home/home_imports.dart';

abstract class IHomeRepository {
  Future<Either<HomeException, BaseUserEntity>> getMemberById(String memberId);
  Future<(HomeException?, BaseUserEntity?)> setUserImage(XFile imageFile, String id);
  Future<Either<HomeException, TimeLineEntity>> fetchTimeline();
  Future<(HomeException?, EventEntity?)> createEvent(EventEntity event);
  Future<(HomeException?, List<EventEntity>?)> getEvents();
  Future<(HomeException?, void)> deleteEvent(String eventId);
  Future<(HomeException?, void)> postEventInTimeline(String eventId);
  Future<(HomeException?, void)> removeEventFromTimeline(String eventId);
  Future<Either<HomeException, List<EventReactionResponse>>> setEventReaction(EventReaction reaction);
  Future<Either<HomeException, List<BibleMessageReactionResponse>>> setBibleMessageReaction(BibleMessageReaction reaction);
  Future<Either<HomeException, List<EventReactionResponse>>> getEventsReactions();
  Future<Either<HomeException, List<BibleMessageReactionResponse>>> getBibleMessagesReactions();
  Future<Either<HomeException, List<EventReactionResponse>>> updateEventReaction(UpdateReactionEntity reaction);
  Future<Either<HomeException, List<BibleMessageReactionResponse>>> updateBibleMessageReaction(UpdateReactionEntity reaction);
  Future<Either<HomeException, List<EventReactionResponse>>> removeEventReaction(RemoveReactionEntity reaction);
  Future<Either<HomeException, List<BibleMessageReactionResponse>>> removeBibleMessageReaction(RemoveReactionEntity reaction);
}
