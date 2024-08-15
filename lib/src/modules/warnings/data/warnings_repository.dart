import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

class WarningsRepository implements IWarningsRepository {
  WarningsRepository(this._appClient);
  final AppClient _appClient;

  @override
  Future<(WarningException?, AnnouncementEntity?)> createAnnouncement(AnnouncementEntity announcement) async {
    try {
      final response = await _appClient.post("$API_URL/announcements", body: announcement.creationMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == HttpStatus.created) {
        final announcementMap = jsonDecode(response.body) as Map<String, dynamic>;
        final announcement = AnnouncementEntity.fromMap(announcementMap);
        return (null, announcement);
      } else {
        return (CreateAnnouncementException(exception: "Não foi possível adicionar um novo anúncio. Erro: ${response.body}"), null);
      }
    } catch (e) {
      return (CreateAnnouncementException(exception: "Erro: $e"), null);
    }
  }

  @override
  Future<(WarningException?, void)> createAnnouncements(AnnouncementEntity announcement) async {
    try {
      final annoucementsList = fulfillMonthAnnouncements(announcement, 7);

      final mapList = annoucementsList.map((e) => e.creationMap()).toList();

      final response = await _appClient.post("$API_URL/announcements/list", body: mapList, headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == HttpStatus.created) {
        return (null, null);
      } else {
        return (CreateAnnouncementException(exception: "Não foi possível adicionar anúncios em série. Erro: ${response.body}"), null);
      }
    } catch (e) {
      return (CreateAnnouncementException(exception: "Erro: $e"), null);
    }
  }

  @override
  Future<(WarningException?, List<AnnouncementEntity>)> getAnnouncements() async {
    try {
      final List<AnnouncementEntity> announcements = [];
      final response = await _appClient.get("$API_URL/announcements", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == HttpStatus.ok) {
        final mapsList = jsonDecode(response.body) as List;

        for (var i = 0; i < mapsList.length; i++) {
          final map = mapsList[i];
          final annoucement = AnnouncementEntity.fromMap(map);
          announcements.add(annoucement);
        }

        return (null, announcements);
      } else {
        return (
          GetAnnouncementsException(exception: "Não foi possível adicionar um novo anúncio. Erro: ${response.body}"),
          announcements,
        );
      }
    } catch (e) {
      return (
        GetAnnouncementsException(exception: "Erro: $e"),
        <AnnouncementEntity>[],
      );
    }
  }

  @override
  Future<(WarningException?, void)> deleteAnnouncement(AnnouncementEntity announcement) async {
    try {
      final response = await _appClient.delete("$API_URL/announcements/${announcement.id}", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode != HttpStatus.ok) {
        return (DeleteAnnouncementException(exception: "Não foi possível deletar o anúncio. Erro: ${response.body}"), null);
      } else {
        return (null, null);
      }
    } catch (e) {
      return (DeleteAnnouncementException(exception: "Erro: $e"), null);
    }
  }

  List<AnnouncementEntity> fulfillMonthAnnouncements(AnnouncementEntity announcement, int daysRange) {
    List<AnnouncementEntity> announcementsList = [];
    announcementsList.add(announcement);
    int announcementDay = int.parse(announcement.dateString.split("/").last);
    final announcementMonth = int.parse(announcement.dateString.split("/")[1]);
    final announcementYear = int.parse(announcement.dateString.split("/").first);
    final daysInMonth = getTotalDaysInCurrentMonth(announcementMonth);
    do {
      AnnouncementEntity updatedAnnouncement = announcement.copyWith(announcement);
      announcementDay = announcementDay + daysRange;
      updatedAnnouncement.dateString = "$announcementYear/$announcementMonth/$announcementDay";
      updatedAnnouncement.fixedWarning = true;
      announcementsList.add(updatedAnnouncement);
      log("${announcementsList.map((e) => e.toMap()).toList()}");
    } while (announcementDay + daysRange <= daysInMonth);

    return announcementsList;
  }
}
