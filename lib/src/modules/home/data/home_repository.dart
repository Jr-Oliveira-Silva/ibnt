import 'package:app_ibnt/src/modules/home/home_imports.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository(this._appClient) {
    () async => await getEventsReactions();
  }
  final AppClient _appClient;

  @override
  Future<Either<HomeException, BaseUserEntity>> getMemberById(String memberId) async {
    try {
      late BaseUserEntity user;
      final response = await _appClient.get("$API_URL/members/$memberId", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == HttpStatus.ok) {
        var memberMap = jsonDecode(response.body) as Map<String, dynamic>;
        user = userTypeDefinition(memberMap);
        return right(user);
      } else {
        return left(UserException(exception: response.body));
      }
    } catch (e) {
      return left(UserException(exception: "Erro ao carregar dados do usuário."));
    }
  }

  @override
  Future<(HomeException?, BaseUserEntity?)> setUserImage(XFile imageFile, String id) async {
    try {
      final response = await _appClient.formDataHandler(
        imageFile,
        "imageFile",
        "$API_URL/members/images/$id",
        'POST',
        headers: {"authorization": "Bearer $user_token"},
      ) as StreamedResponse;
      if (response.statusCode != HttpStatus.ok) {
        return (SetEventImageException(exception: "Erro ao definir imagem do usuário $id."), null);
      } else {
        final body = jsonDecode(await response.stream.bytesToString());
        final user = MemberDto.fromMap(body);
        final result = await getMemberById(user.id!);
        return (null, result.fold((l) => null, (r) => r));
      }
    } catch (e) {
      throw SetEventImageException(exception: '$e');
    }
  }

  @override
  Future<Either<HomeException, TimeLineEntity>> fetchTimeline() async {
    try {
      final timelineEntity = TimeLineEntity(title: "", timeline: []);
      final eventsList = <EventEntity>[];
      final messagesList = <MessageEntity>[];

      final response = await _appClient.get("$API_URL/timeline", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == HttpStatus.badRequest) {
        return left(TimeLineException(exception: response.body));
      } else if (response.statusCode == HttpStatus.ok) {
        final jsonTimeline = jsonDecode(response.body) as Map<String, dynamic>;
        final eventsJsonList = jsonTimeline["events"] as List;
        final messagesJsonList = jsonTimeline["bibleMessages"] as List;

        for (var i = 0; i < eventsJsonList.length; i++) {
          var jsonEvent = eventsJsonList[i];
          final eventEntity = EventEntity.fromMap(jsonEvent);
          if (!eventsList.contains(eventEntity)) {
            eventsList.add(eventEntity);
          }
        }

        for (var i = 0; i < messagesJsonList.length; i++) {
          var jsonMessage = messagesJsonList[i];
          final memberMessage = MessageEntity.fromMap(jsonMessage);
          if (!messagesList.contains(memberMessage)) {
            messagesList.add(memberMessage);
          }
        }
        timelineEntity.timeline.addAll(eventsList);
        timelineEntity.timeline.addAll(messagesList);
        return right(timelineEntity);
      } else {
        return left(TimeLineException(exception: response.body));
      }
    } catch (e) {
      return left(TimeLineException(exception: "Erro ao carregar timeline."));
    }
  }

  @override
  Future<(HomeException?, List<BaseUserEntity>?)> getMembers() async {
    try {
      final response = await _appClient.get("$API_URL/members", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode != HttpStatus.ok) {
        final message = response.body.toString();
        return (UserException(exception: message), <BaseUserEntity>[]);
      } else {
        final membersJsonList = jsonDecode(response.body) as List;
        final members = membersJsonList.map((memberMap) => userTypeDefinition(memberMap)).toList();
        return (null, members);
      }
    } on HomeException catch (e) {
      return (UserException(exception: "$e"), <BaseUserEntity>[]);
    } catch (e) {
      return (UserException(exception: "$e"), <BaseUserEntity>[]);
    }
  }

  @override
  Future<(HomeException?, EventEntity?)> createEvent(EventEntity event) async {
    try {
      final eventMap = event.toMap();

      final eventImage = eventMap.remove("imageField") as XFile;

      final response = await _appClient.post("$API_URL/events", body: eventMap, headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode != HttpStatus.created) {
        final message = response.body.toString();
        return (CreateEventException(exception: message), null);
      } else {
        final createdEvent = EventEntity.fromMap(jsonDecode(response.body));
        return await setEventImage(eventImage, createdEvent.id!);
      }
    } on HomeException catch (e) {
      if (e is SetEventImageException) {
        return (e, null);
      } else {
        return (CreateEventException(exception: '$e'), null);
      }
    } catch (e) {
      return (CreateEventException(exception: '$e'), null);
    }
  }

  @override
  Future<(HomeException?, List<EventEntity>?)> getEvents() async {
    try {
      final response = await _appClient.get("$API_URL/events", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode != HttpStatus.ok) {
        final message = response.body.toString();
        return (GetEventsException(exception: message), <EventEntity>[]);
      } else {
        final eventsJsonList = jsonDecode(response.body) as List;
        final events = eventsJsonList.map((eventMap) => EventEntity.fromMap(eventMap)).toList();
        return (null, events);
      }
    } on HomeException catch (e) {
      return (GetEventsException(exception: '$e'), null);
    } catch (e) {
      return (GetEventsException(exception: '$e'), null);
    }
  }

  @override
  Future<(HomeException?, void)> deleteEvent(String eventId) async {
    try {
      final response = await _appClient.delete("$API_URL/events/$eventId", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode != HttpStatus.noContent) {
        final message = response.body.toString();
        return (DeleteEventException(exception: message), null);
      } else {
        return (null, null);
      }
    } on HomeException catch (e) {
      return (DeleteEventException(exception: '$e'), null);
    } catch (e) {
      return (DeleteEventException(exception: '$e'), null);
    }
  }

  Future<(HomeException?, EventEntity?)> setEventImage(XFile imageFile, String id) async {
    try {
      final response = await _appClient.formDataHandler(
        imageFile,
        "imageFile",
        "$API_URL/events/images/$id",
        'POST',
        headers: {"authorization": "Bearer $user_token"},
      ) as StreamedResponse;
      if (response.statusCode != HttpStatus.ok) {
        return (SetEventImageException(exception: "Erro ao definir imagem do evento $id."), null);
      } else {
        final body = jsonDecode(await response.stream.bytesToString());
        final newEvent = EventEntity.fromMap(body);
        return (null, newEvent);
      }
    } catch (e) {
      throw SetEventImageException(exception: '$e');
    }
  }

  @override
  Future<Either<HomeException, List<EventReactionResponse>>> setEventReaction(EventReaction reaction) async {
    try {
      List<EventReactionResponse> eventsReactions = [];

      final response = await _appClient.post("$API_URL/reactions/events", body: reaction.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == HttpStatus.ok) {
        final reactionsList = jsonDecode(response.body) as List;
        for (var i = 0; i < reactionsList.length; i++) {
          final eventReaction = EventReactionResponse.fromMap(reactionsList[i]);
          eventsReactions.add(eventReaction);
        }
        return right(eventsReactions);
      } else {
        return left(ReactionException(exception: response.body));
      }
    } catch (e) {
      return left(ReactionException(exception: "Erro ao reagir ao evento."));
    }
  }

  @override
  Future<Either<HomeException, List<BibleMessageReactionResponse>>> setBibleMessageReaction(BibleMessageReaction reaction) async {
    try {
      List<BibleMessageReactionResponse> bibleMessagesReactions = [];

      final response = await _appClient.post("$API_URL/reactions/bible-messages", body: reaction.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == HttpStatus.ok) {
        final reactionsList = jsonDecode(response.body) as List;
        for (var i = 0; i < reactionsList.length; i++) {
          final bibleMessageReaction = BibleMessageReactionResponse.fromMap(reactionsList[i]);
          bibleMessagesReactions.add(bibleMessageReaction);
        }
        return right(bibleMessagesReactions);
      } else {
        return left(ReactionException(exception: response.body));
      }
    } catch (e) {
      return left(ReactionException(exception: "Erro ao reagir à mensagem."));
    }
  }

  BaseUserEntity userTypeDefinition(Map<String, dynamic> userMap) {
    String type = userMap["credential"]["role"];
    final list = userMap["departments"] as List;
    List<DepartmentEntity> departments = list.map((department) => DepartmentEntity.fromMap(department)).toList();
    return type == "user"
        ? MemberEntity(
            id: userMap["id"],
            fullName: userMap["fullName"],
            profileImage: userMap["profileImage"],
            departments: departments,
            userCredential: AppUserCredential(
              email: userMap["credential"]["email"],
              role: UserRole.user,
            ))
        : AdminEntity(
            id: userMap["id"],
            fullName: userMap["fullName"],
            profileImage: userMap["profileImage"],
            departments: departments,
            userCredential: AppUserCredential(
              email: userMap["credential"]["email"],
              role: UserRole.admin,
            ));
  }

  @override
  Future<Either<HomeException, List<EventReactionResponse>>> getEventsReactions() async {
    try {
      List<EventReactionResponse> eventsReactions = [];

      final response = await _appClient.get("$API_URL/reactions/events", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode == HttpStatus.ok) {
        final list = jsonDecode(response.body) as List;
        for (var i = 0; i < list.length; i++) {
          final eventReaction = EventReactionResponse.fromMap(list[i]);
          eventsReactions.add(eventReaction);
        }
        return right(eventsReactions);
      } else {
        final message = jsonDecode(response.body);
        return left(EventsReactionsListException(exception: message));
      }
    } catch (e) {
      return left(EventsReactionsListException(exception: "Não foi possível obter lista de reações aos eventos."));
    }
  }

  @override
  Future<Either<HomeException, List<BibleMessageReactionResponse>>> getBibleMessagesReactions() async {
    try {
      List<BibleMessageReactionResponse> bibleMessagesReactions = [];

      final response = await _appClient.get("$API_URL/reactions/bible-messages", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode == HttpStatus.ok) {
        final list = jsonDecode(response.body) as List;
        for (var i = 0; i < list.length; i++) {
          final bibleMessageReaction = BibleMessageReactionResponse.fromMap(list[i]);
          bibleMessagesReactions.add(bibleMessageReaction);
        }
        return right(bibleMessagesReactions);
      } else {
        final message = jsonDecode(response.body);
        return left(BibleMessagesReactionsListException(exception: message));
      }
    } catch (e) {
      return left(BibleMessagesReactionsListException(exception: "Não foi possível obter lista de reações às Mensagens."));
    }
  }

  @override
  Future<Either<HomeException, List<EventReactionResponse>>> updateEventReaction(UpdateReactionEntity reaction) async {
    try {
      final response = await _appClient.put("$API_URL/reactions/events", body: reaction.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode == HttpStatus.ok) {
        return await getEventsReactions();
      } else {
        final message = jsonDecode(response.body);
        return left(UpdateReactionException(exception: message));
      }
    } catch (e) {
      return left(UpdateReactionException(exception: "Não foi possível obter lista de reações."));
    }
  }

  @override
  Future<Either<HomeException, List<BibleMessageReactionResponse>>> updateBibleMessageReaction(UpdateReactionEntity reaction) async {
    try {
      final response = await _appClient.put("$API_URL/reactions/bible-messages", body: reaction.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode == HttpStatus.ok) {
        return await getBibleMessagesReactions();
      } else {
        final message = jsonDecode(response.body);
        return left(UpdateReactionException(exception: message));
      }
    } catch (e) {
      return left(UpdateReactionException(exception: "Não foi possível obter lista de reações."));
    }
  }

  @override
  Future<Either<HomeException, List<EventReactionResponse>>> removeEventReaction(RemoveReactionEntity reaction) async {
    try {
      final response = await _appClient.delete("$API_URL/reactions/remove-reaction", body: reaction.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode == HttpStatus.noContent) {
        return await getEventsReactions();
      } else {
        final message = jsonDecode(response.body);
        return left(RemoveReactionException(exception: message));
      }
    } catch (e) {
      return left(RemoveReactionException(exception: "Não foi possível obter lista de reações."));
    }
  }

  @override
  Future<Either<HomeException, List<BibleMessageReactionResponse>>> removeBibleMessageReaction(RemoveReactionEntity reaction) async {
    try {
      final response = await _appClient.delete("$API_URL/reactions/remove-reaction", body: reaction.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode == HttpStatus.noContent) {
        return await getBibleMessagesReactions();
      } else {
        final message = jsonDecode(response.body);
        return left(RemoveReactionException(exception: message));
      }
    } catch (e) {
      return left(RemoveReactionException(exception: "Não foi possível obter lista de reações."));
    }
  }

  @override
  Future<(HomeException?, void)> postEventInTimeline(String eventId) async {
    try {
      final response = await _appClient.post("$API_URL/timeline/event/$eventId", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode != HttpStatus.ok) {
        final message = response.body.toString();
        return (PostEventInTimelineException(exception: message), null);
      } else {
        return (null, null);
      }
    } on HomeException catch (e) {
      return (PostEventInTimelineException(exception: '$e'), null);
    } catch (e) {
      return (PostEventInTimelineException(exception: '$e'), null);
    }
  }

  @override
  Future<(HomeException?, void)> removeEventFromTimeline(String eventId) async {
    try {
      final response = await _appClient.delete("$API_URL/timeline/event/$eventId", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode != HttpStatus.ok) {
        final message = response.body.toString();
        return (RemoveEventFromTimelineException(exception: message), null);
      } else {
        return (null, null);
      }
    } on HomeException catch (e) {
      return (RemoveEventFromTimelineException(exception: '$e'), null);
    } catch (e) {
      return (RemoveEventFromTimelineException(exception: '$e'), null);
    }
  }
}
