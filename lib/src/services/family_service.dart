import '../api/api.dart';

class FamilyService {
  static final FamilyService _authService = FamilyService._();

  factory FamilyService() => _authService;

  FamilyService._();

  Future<dynamic> login(String email, String type, String password) async {
    Map<String, String> formData = {
      "password": password,
      "email": email,
      "type": type
    };
    return await HttpsConfig().postCall(EndPoint.login, formData);
  }

  Future<dynamic> getFamily(String id) async {
    final queryParameters = {"Missionariy_Id": id};
    return await HttpsConfig()
        .getCallParams(EndPoint.getFamily, queryParameters);
  }

  Future<dynamic> getAllFamily(String id) async {
    final queryParameters = {"Missionariy_Id": id};
    return await HttpsConfig()
        .getCallParams(EndPoint.getAllFamily, queryParameters);
  }

  Future<dynamic> getAllFamilyMembers(String id) async {
    final queryParameters = {"Mid": id};
    return await HttpsConfig()
        .getCallParams(EndPoint.getAllMembers, queryParameters);
  }

  Future<dynamic> createFamily(
      String familyName,
      String familyPhoneNumber,
      photo,
      int stateId,
      int districtId,
      int talukId,
      int religionId,
      int casteId,
      int villageId,
      bool isInChurch,
      churchId,
      String pinCode,
      address,
      int interestId,
      String name,
      String education,
      int gender,
      String dateOfBirth,
      bool isBaptism,
      String baptismChurch,
      String occupation,
      String dateOfBaptism,
      String dateOfMembership,
      int isMarried,
      String phoneNumber,
      String id) async {
    final queryParameters = {
      "familyName": familyName,
      "familyPhoneNumber": familyPhoneNumber,
      "photo": photo,
      "stateId": stateId,
      "districtId": districtId,
      "talukId": talukId,
      "religionId": religionId,
      "casteId": casteId,
      "villageId": villageId,
      "isInChruch": isInChurch,
      "churchId": churchId,
      "pinCode": pinCode,
      "address": address,
      "intrest_Id": interestId,
      "name": name,
      "education": education,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "isBaptism": isBaptism,
      "baptismChurch": baptismChurch,
      "occupation": occupation,
      "dateOfBaptism": dateOfBaptism,
      "dateOfMembership": dateOfMembership,
      "isMarried": isMarried,
      "phoneNumber": phoneNumber,
      "missionariy_Id": id
    };
    return await HttpsConfig()
        .postCallParams(EndPoint.createFamily, queryParameters);
  }

  Future<dynamic> getStates() async {
    return await HttpsConfig().getCall(EndPoint.getStates);
  }

  Future<dynamic> getCenter() async {
    return await HttpsConfig().getCall(EndPoint.getCenter);
  }

  Future<dynamic> getAllVillage() async {
    return await HttpsConfig().getCall(EndPoint.getAllVillage);
  }

  Future<dynamic> getDistrict(String stateId) async {
    final queryParameters = {"StateId": stateId};
    return await HttpsConfig()
        .getCallParams(EndPoint.getDistricts, queryParameters);
  }

  Future<dynamic> getTaluk(String districtId) async {
    final queryParameters = {"DistrictId": districtId};
    return await HttpsConfig()
        .getCallParams(EndPoint.getTaluk, queryParameters);
  }

  Future<dynamic> getVillage(String talukId) async {
    final queryParameters = {"TalukId": talukId};
    return await HttpsConfig()
        .getCallParams(EndPoint.getVillage, queryParameters);
  }

  Future<dynamic> getReligion() async {
    return await HttpsConfig().getCall(EndPoint.getReligion);
  }

  Future<dynamic> getCastes() async {
    return await HttpsConfig().getCall(EndPoint.getCastes);
  }

  Future<dynamic> getChurch() async {
    return await HttpsConfig().getCall(EndPoint.getChurch);
  }

  Future<dynamic> getInterestStatus() async {
    return await HttpsConfig().getCall(EndPoint.getInterestStatus);
  }

  Future<dynamic> getFamilyMembers(String familyID) async {
    final queryParameters = {"FamilyId": familyID};
    return await HttpsConfig()
        .getCallParams(EndPoint.getFamilyMembers, queryParameters);
  }

  Future<dynamic> createMember(
      photo,
      String name,
      gender,
      dateOfBirth,
      isBaptism,
      baptismChurch,
      education,
      occupation,
      dateOfBaptism,
      dateOfMembership,
      isMarried,
      phoneNumber,
      familyId,
      missionaryId,
      relationId) async {
    final queryParameters = {
      "photo": photo,
      "name": name,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "isBaptism": isBaptism,
      "baptismChurch": baptismChurch,
      "education": education,
      "occupation": occupation,
      "dateOfBaptism": dateOfBaptism,
      "dateOfMembership": dateOfMembership,
      "isMarried": isMarried,
      "phoneNumber": phoneNumber,
      "familyId": familyId,
      "missionariy_Id": missionaryId,
      "relationId": relationId,
    };
    return await HttpsConfig()
        .postCallParams(EndPoint.createMember, queryParameters);
  }

  Future<dynamic> editFamily(
      String familyName,
      String familyPhoneNumber,
      String photo,
      String editPhoto,
      int stateId,
      int districtId,
      int talukId,
      int religionId,
      int casteId,
      int villageId,
      bool isInChurch,
      churchId,
      String pinCode,
      String address,
      int interestId,
      String name,
      String education,
      int gender,
      String dateOfBirth,
      bool isBaptism,
      String baptismChurch,
      String occupation,
      String dateOfBaptism,
      String dateOfMembership,
      int isMarried,
      String phoneNumber,
      String id,
      familyId,
      classId) async {
    final queryParameters = {
      "familyName": familyName,
      "familyPhoneNumber": familyPhoneNumber,
      "photo": photo,
      "photoSaved": editPhoto,
      "stateId": stateId,
      "districtId": districtId,
      "talukId": talukId,
      "religionId": religionId,
      "casteId": casteId,
      "villageId": villageId,
      "isInChruch": isInChurch,
      "churchId": churchId,
      "pinCode": pinCode,
      "address": address,
      "intrest_Id": interestId,
      "name": name,
      "education": education,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "isBaptism": isBaptism,
      "baptismChurch": baptismChurch,
      "occupation": occupation,
      "dateOfBaptism": dateOfBaptism,
      "dateOfMembership": dateOfMembership,
      "isMarried": isMarried,
      "familyId": familyId,
      "id": classId,
      "phoneNumber": phoneNumber,
      "missionariy_Id": id
    };
    return await HttpsConfig()
        .postCallParams(EndPoint.createFamily, queryParameters);
  }

  Future<dynamic> editMember(
      String photo,
      String editPhoto,
      int id,
      String name,
      int gender,
      String dateOfBirth,
      bool isBaptism,
      String baptismChurch,
      String education,
      String occupation,
      String dateOfBaptism,
      String dateOfMembership,
      int isMarried,
      String phoneNumber,
      int familyId,
      int missionaryId,
      int relationId,
      bool? isDead,
      bool? isHead) async {
    final queryParameters = {
      "photo": photo,
      "photoSaved": editPhoto,
      "id": id,
      "name": name,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "isBaptism": isBaptism,
      "baptismChurch": baptismChurch,
      "education": education,
      "occupation": occupation,
      "dateOfBaptism": dateOfBaptism,
      "dateOfMembership": dateOfMembership,
      "isMarried": isMarried,
      "phoneNumber": phoneNumber,
      "familyId": familyId,
      "missionariy_Id": missionaryId,
      "relationId": relationId,
      "isDead": isDead ?? false,
      "isHeadOfFamily": isHead ?? false
    };
    return await HttpsConfig()
        .postCallParams(EndPoint.createMember, queryParameters);
  }

  Future<dynamic> getRelation() async {
    return await HttpsConfig().getCall(EndPoint.getRelations);
  }
}
