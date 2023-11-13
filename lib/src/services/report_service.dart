import '../api/api.dart';

class ReportService {
  static final ReportService _authService = ReportService._();

  factory ReportService() => _authService;

  ReportService._();

  Future<Object> getDailyReport(String id, int month, int year) async {
    final queryParameters = {"Missionary_Id": id, "Month": month, "Year": year};
    return await HttpsConfig()
        .getCallParams(EndPoint.dailyEntry, queryParameters);
  }

  Future<Object> addDailyEntry(
    date,
    bool isLeave,
    String reason,
    int stateId,
    int missionId,
    int noVisitedVillage,
    int noVisitedHouse,
    int distance,
    int receipts,
    int payments,
    String center,
    int fastingPrayer,
    int youthFellowship,
    int womenFellowship,
    int cottageMeeting,
    int sundaySchool,
    int churchCommittee,
    List visitedVillageId,
    List visitedHouseIds,
    int trackDistribution,
    int bibleDistribution,
    int prayerMeetings,
    int bibleStudy,
    int baptism,
  ) async {
    final queryParameters = {
      "isLeave": isLeave,
      "dateTday": date,
      "reason": reason,
      "state_Id": stateId,
      "missionary_Id": missionId,
      "visitedVillages": noVisitedVillage,
      "visitedHoueses": noVisitedHouse,
      "distanceTravelled": distance,
      "receipts": receipts,
      "payments": payments,
      "center": center,
      "fastingPrayer": fastingPrayer,
      "youthFellowship": youthFellowship,
      "womensFellowship": womenFellowship,
      "cottageMeeting": cottageMeeting,
      "sundaySchool": sundaySchool,
      "churchCommittee": churchCommittee,
      "visitedVillageIds":
          visitedVillageId.isNotEmpty ? visitedVillageId : null,
      "visitedHouseIds": visitedHouseIds.isNotEmpty ? visitedHouseIds : null,
      "trackDistribution": trackDistribution,
      "bibleDistribution": bibleDistribution,
      "prayerMeetings": prayerMeetings,
      "bibleStudy": bibleStudy,
      "baptisam": baptism,
      "memberDetails": []
    };
    return await HttpsConfig().postCallParams(EndPoint.daily, queryParameters);
  }

  Future<dynamic> programsEntry(
    date,
    String reason,
    int tractDistribution,
    int bibleDistribution,
    int prayerMeetings,
    int bibleStudy,
    int baptism,
    bool fastingPrayer,
    bool youthFellowship,
    bool womensFellowship,
    bool cottageMeeting,
    bool sundaySchool,
    bool churchCommittee,
    bool christmasGiftsDistribution,
    int missionaryId,
    int educationAid,
    int educationKits,
    int marriageAid,
    int widowAid,
    int aidrDifferentlyAbled,
    int medicalAid,
    int houseConstructionAid,
    int otherAid,
    int cottageNoofCharityWorks,
    int cottageNoofnewVillages,
    int cottageNoofnewEvangelists,
    int cottageTotalReceiptsExpenses,
    int cottagePrayerRequests,
    String remark,
  ) async {
    final queryParameters = {
      "dateTday": date,
      "reason": reason,
      "tractDistribution": tractDistribution,
      "bibleDistribution": bibleDistribution,
      "prayerMeetings": prayerMeetings,
      "bibleStudy": bibleStudy,
      "baptism": baptism,
      "fastingPrayer": fastingPrayer,
      "youthFellowship": youthFellowship,
      "womensFellowship": womensFellowship,
      "cottageMeeting": cottageMeeting,
      "sundaySchool": sundaySchool,
      "churchCommittee": churchCommittee,
      "christmasGiftsDistribution": christmasGiftsDistribution,
      "missionary_Id": missionaryId,
      "educationAid": educationAid,
      "educationKits": educationKits,
      "marriageAid": marriageAid,
      "widowAid": widowAid,
      "aidrDifferentlyAbled": aidrDifferentlyAbled,
      "medicalAid": medicalAid,
      "houseConstructionAid": houseConstructionAid,
      "otherAid": otherAid,
      "isCottageNoofCharityWorks": true,
      "cottageNoofCharityWorks": cottageNoofCharityWorks,
      "isCottageNoofnewVillages": true,
      "cottageNoofnewVillages": cottageNoofnewVillages,
      "isCottageNoofnewEvangelists": true,
      "cottageNoofnewEvangelists": cottageNoofnewEvangelists,
      "isCottageTotalReceiptsExpenses": true,
      "cottageTotalReceiptsExpenses": cottageTotalReceiptsExpenses,
      "isCottagePrayerRequests": true,
      "cottagePrayerRequests": cottagePrayerRequests,
      "remarks": remark,
      "entryDetails": [
        {"name": "string", "description": "string", "type": "string"}
      ],
      "memberDetails": []
    };
    return await HttpsConfig()
        .postCallParams(EndPoint.programsEntry, queryParameters);
  }

  Future<dynamic> xMasGift(
      date, int id, int giftType, list, String type) async {
    final queryParameters = {
      "dateTday": date,
      "missionary_Id": id,
      "giftType": giftType,
      "type": type,
      "memberDetails": list,
      "id": 0,
      "christmasGifts": null,
    };

    return await HttpsConfig()
        .postCallParams(EndPoint.christmasGifts, queryParameters);
  }

  Future<dynamic> xMasGiftEdit(
      date, int id, int giftType, list, String type, giftDataId) async {
    final queryParameters = {
      "dateTday": date,
      "missionary_Id": id,
      "giftType": giftType,
      "type": type,
      "memberDetails": list,
      "id": giftDataId,
      "christmasGifts": null,
    };

    return await HttpsConfig()
        .postCallParams(EndPoint.christmasGifts, queryParameters);
  }

  Future<dynamic> xMasGiftUpdate(
      date, int id, int giftType, list, String type, distId) async {
    final queryParameters = {
      "dateTday": date,
      "missionary_Id": id,
      "giftType": giftType,
      "type": type,
      "memberDetails": list,
      "id": distId,
    };

    return await HttpsConfig()
        .postCallParams(EndPoint.christmasGifts, queryParameters);
  }

  Future<dynamic> getProgramsEntry(String id) async {
    final queryParameters = {"Missionary_Id": id};
    return await HttpsConfig().getCallParams(EndPoint.year, queryParameters);
  }

  Future<dynamic> postSundayWorship(
      date,
      String reason,
      int baptizedBelievers,
      int nonBaptizedBelievers,
      int evangelists,
      int guests,
      startTime,
      endTime,
      int offertoryAmount,
      int worshipExpenseAmount,
      int id,
      int masterSundayWorshipID,
      payment,
      receipts,
      int children,
      String memberId,
      bool attendance) async {
    final queryParameters = {
      "dateTday": date,
      "reason": reason,
      "baptizedBelievers": baptizedBelievers,
      "nonbaptizedBelievers": nonBaptizedBelievers,
      "id": 0,
      "evangelists": evangelists,
      "guests": guests,
      "startTime": startTime,
      "endTime": endTime,
      "offertoryAmount": offertoryAmount,
      "worshipExpenseAmount": worshipExpenseAmount,
      "missionary_Id": id,
      'masterSundayWorshipID': masterSundayWorshipID,
      "payment": payment,
      "receipts": receipts,
      "children": children,
      "memberID": memberId,
      'isAttendance': attendance
    };
    return await HttpsConfig()
        .postCallParams(EndPoint.addSundayWorship, queryParameters);
  }

  Future<dynamic> getSundayDetails(String id) async {
    final queryParameters = {"id": id};
    return await HttpsConfig()
        .getCallParams(EndPoint.sundayWorshipSingle, queryParameters);
  }

  Future<dynamic> getSunday(String id) async {
    final queryParameters = {"Missionary_Id": id};
    return await HttpsConfig()
        .getCallParams(EndPoint.sundayWorship, queryParameters);
  }

  Future<dynamic> editSundayWorship(
      date,
      String reason,
      int baptizedBelievers,
      int nonBaptizedBelievers,
      int evangelists,
      int guests,
      startTime,
      endTime,
      int offertoryAmount,
      int worshipExpenseAmount,
      int id,
      int masterSundayWorshipID,
      payment,
      receipts,
      int editId) async {
    final queryParameters = {
      "dateTday": date,
      "reason": reason,
      "baptizedBelievers": baptizedBelievers,
      "nonbaptizedBelievers": nonBaptizedBelievers,
      "evangelists": evangelists,
      "guests": guests,
      "startTime": startTime,
      "endTime": endTime,
      "offertoryAmount": offertoryAmount,
      "worshipExpenseAmount": worshipExpenseAmount,
      "missionary_Id": id,
      'masterSundayWorshipID': masterSundayWorshipID,
      "payment": payment,
      "receipts": receipts,
      "id": editId,
    };
    return await HttpsConfig()
        .postCallParams(EndPoint.addSundayWorship, queryParameters);
  }

  Future<dynamic> getPrayer(String id) async {
    final queryParameters = {"Missionariy_Id": id};
    return await HttpsConfig().getCallParams(EndPoint.prayer, queryParameters);
  }

  Future<dynamic> createPrayer(
      String name, String description, int id, String type) async {
    final queryParameters = {
      "name": name,
      "description": description,
      "missionariy_Id": id,
      "type": type
    };
    return await HttpsConfig()
        .postCallParams(EndPoint.createPrayer, queryParameters);
  }

  Future<dynamic> programEntryDetails(String id) async {
    final queryParameters = {"Id": id};
    return await HttpsConfig()
        .getCallParams(EndPoint.programsEntryDetails, queryParameters);
  }

  Future<dynamic> getDailyReportDetails(String id) async {
    final queryParameters = {"Id": id};
    return await HttpsConfig()
        .getCallParams(EndPoint.dailyEntryDetails, queryParameters);
  }

  Future<dynamic> getChristmasGifts(String id, String type) async {
    final queryParameters = {"Missionary_Id": id, "Type": type};
    return await HttpsConfig()
        .getCallParams(EndPoint.christmasGifts, queryParameters);
  }

  Future<dynamic> getChristmasGiftsDetails(String id) async {
    final queryParameters = {"Id": id};
    return await HttpsConfig()
        .getCallParams(EndPoint.christmasGiftsDetails, queryParameters);
  }

  Future<dynamic> allRequestPrayer(String id, String type) async {
    final queryParameters = {"Missionariy_Id": id, "type": type};
    return await HttpsConfig()
        .getCallParams(EndPoint.allRequest, queryParameters);
  }

  Future<dynamic> yearPlan(
      charityTypeID,
      date,
      int trackDistribution,
      int bibleDistribution,
      int prayerMeetings,
      int bibleStudy,
      int baptisam,
      int id,
      int fastingPrayer,
      int youthFellowship,
      int womensFellowship,
      int sundaySchool,
      int churchCommittee,
      int receipts,
      int payments,
      int charityWorks,
      int villages,
      int evangelists,
      int educationAid,
      int educationKit,
      int marriageAid,
      int widowAid,
      int aidForDifferentlyAbled,
      int medicalAid,
      int houseConstructionAid,
      int otherAid,
      String remark) async {
    final queryParameters = {
      "charityTypeID": charityTypeID,
      "dateTday": date,
      "trackDistribution": trackDistribution,
      "bibleDistribution": bibleDistribution,
      "prayerMeetings": prayerMeetings,
      "bibleStudy": bibleStudy,
      "baptisam": baptisam,
      "missionary_Id": id,
      "fastingPrayer": fastingPrayer,
      "youthFellowship": youthFellowship,
      "womensFellowship": womensFellowship,
      "sundaySchool": sundaySchool,
      "churchCommittee": churchCommittee,
      "receipts": receipts,
      "payments": payments,
      "charityWorks": charityWorks,
      "villages": villages,
      "evangelists": evangelists,
      "educationAid": educationAid,
      "educationKit": educationKit,
      "marriageAid": marriageAid,
      "widowAid": widowAid,
      "aidForDifferentlyAbled": aidForDifferentlyAbled,
      "medicalAid": medicalAid,
      "houseConstructionAid": houseConstructionAid,
      "remarks": remark,
      "otherAid": otherAid
    };
    return await HttpsConfig().postCallParams(EndPoint.yearly, queryParameters);
  }

  Future<dynamic> getYearPlan(String id) async {
    final queryParameters = {"Missionary_Id": id};
    return await HttpsConfig().getCallParams(EndPoint.yearly, queryParameters);
  }

  Future<dynamic> getCharityType() async {
    return await HttpsConfig().getCall(EndPoint.getCharityType);
  }

  Future<dynamic> getMasterSundayWorships() async {
    return await HttpsConfig().getCall(EndPoint.getMasterSundayWorships);
  }

  Future<dynamic> getLeave(String id) async {
    final queryParameters = {"Id": id};
    return await HttpsConfig()
        .getCallParams(EndPoint.getLeave, queryParameters);
  }

  Future<dynamic> leaveCall(
    date,
    description,
    missionaryId,
  ) async {
    final queryParameters = {
      "Date": date,
      "Description": description,
      "Missionary_Id": missionaryId,
    };
    return await HttpsConfig().postCallParams(
        // ignore: prefer_interpolation_to_compose_strings
        EndPoint.leave +
            '?Date=' +
            date +
            '&Description=' +
            description +
            '&Missionary_Id=' +
            missionaryId,
        queryParameters);
  }

  Future<dynamic> getGiftType() async {
    return await HttpsConfig().getCall(EndPoint.getGiftType);
  }

  Future<dynamic> getPrayerDetail(String id) async {
    final queryParameters = {"PrayerRequestID": id};
    return await HttpsConfig()
        .getCallParams(EndPoint.getPrayerDetail, queryParameters);
  }

  Future<dynamic> createComment(
    int mId,
    String description,
    int pId,
  ) async {
    final queryParameters = {
      "Missionariy_Id": mId,
      "Description": description,
      "PrayerRequestID": pId,
    };
    return await HttpsConfig().postCallParams(
        // ignore: prefer_interpolation_to_compose_strings
        EndPoint.createComment +
            '?Missionariy_Id=' +
            mId.toString() +
            '&Description=' +
            description +
            '&PrayerRequestID=' +
            pId.toString(),
        queryParameters);
  }
}
