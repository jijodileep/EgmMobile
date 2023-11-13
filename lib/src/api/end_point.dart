/// The `EndPoint` class contains static constants for various API endpoints used in an application.
class EndPoint {
  ///for live
  static const String baseUrl = "https://egm.alakode.in/";
  static const String imageUrl = "https://egm.alakode.in/UploadedFiles/";

  static const String login = "api/Login/Login";

  static const String getFamily = "api/ChruchFamily/GetFamliy";
  static const String getAllFamily = "api/ChruchFamily/GetAllFamliy";
  static const String createFamily = "api/ChruchFamily/CreateFamily";
  static const String getFamilyMembers = "api/ChruchFamily/GetFamliyMembers";
  static const String createMember = "api/ChruchFamily/FamiliyMember";

  // Report
  static const String dailyEntry = "api/DailyEntry/Daily";
  static const String daily = "api/DailyEntry/Daily";
  static const String dailyEntryDetails = "api/DailyEntry/DailyDetails";
  static const String programsEntry = "api/DailyEntry/ProgramsEntry";
  static const String year = "api/DailyEntry/ProgramsEntry";
  static const String addSundayWorship = "api/DailyEntry/SundayWorship";
  static const String sundayWorship = "api/DailyEntry/SundayWorship";
  static const String sundayWorshipSingle =
      "api/DailyEntry/SundayWorship/single";

  static const String prayer = "api/Prayer";
  static const String createPrayer = "api/Prayer/Create";
  static const String getPrayerDetail = "api/Prayer/GetPrayarDetail";
  static const String allRequest = "api/Prayer/AllRequest";
  static const String createComment = "api/Prayer/CreateComment";

  static const String programsEntryDetails =
      "api/DailyEntry/ProgramsEntryDetails";
  static const String christmasGifts = "api/DailyEntry/ChristmasGifts";
  static const String christmasGiftsDetails =
      "api/DailyEntry/ChristmasGiftsDetails";
  static const String yearly = "api/DailyEntry/Yearly";
  static const String getLeave = "api/DailyEntry/GetLeave";
  static const String leave = "api/DailyEntry/Leave";

  // General
  static const String getStates = "api/gen/General/GetStates";
  static const String getDistricts = "api/gen/General/GetDistricts";
  static const String getTaluk = "api/gen/General/GetTaluk";
  static const String getVillage = "api/gen/General/GetVillage";
  static const String getReligion = "api/gen/General/GetReligion";
  static const String getCastes = "api/gen/General/GetCastes";
  static const String getChurch = "api/gen/General/GetChurch";
  static const String getInterestStatus = "api/gen/General/GetIntrestStatus";
  static const String getRelations = "api/gen/General/GetRelations";
  static const String getCenter = "api/gen/General/GetCenter";
  static const String getAllVillage = "api/gen/General/GetAllVillage";
  static const String getAllMembers = "api/gen/General/GetAllMembers";
  static const String getCharityType = "api/gen/General/GetCharityType";
  static const String getMasterSundayWorships =
      "api/gen/General/GetMasterSundayWorships";
  static const String getGiftType = "api/gen/General/GetGiftType";
}
