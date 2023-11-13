import 'package:get_storage/get_storage.dart';

class AppData {
  static final AppData appData = AppData._();

  late GetStorage _appData;

  factory AppData() => appData;

  AppData._() {
    _appData = GetStorage();
  }

  /// keys
  final String userID = "userID";
  final String userName = "userName";
  final String userEmail = "userEmail";
  final String userPhone = "userPhone";
  final String categoryId = "categoryId";
  final String address = "address";
  final String languageCode = "en";
  final String countryCode = "US";
  final String password = "password";
  final String loginUser = "loginUser";
  final String stateId = 'stateID';
  final String districtId = "districtID";
  final String talukId = "talukId";

  /// user id
  storeUserID(String value) {
    _appData.write(userID, value);
  }

  String getUserID() {
    return _appData.read(userID) ?? '';
  }

  storeUserName(String value) {
    _appData.write(userName, value);
  }

  String getUserName() {
    return _appData.read(userName) ?? '';
  }

  storeUserEmail(String value) {
    _appData.write(userEmail, value);
  }

  String getUserEmail() {
    return _appData.read(userEmail) ?? '';
  }

  storeUserPhone(String value) {
    _appData.write(userPhone, value);
  }

  String getUserUserPhone() {
    return _appData.read(userPhone) ?? '';
  }

  storeUserCategoryId(String value) {
    _appData.write(categoryId, value);
  }

  String getUserUserCategoryId() {
    return _appData.read(categoryId) ?? '';
  }

  storeUserAddress(String value) {
    _appData.write(address, value);
  }

  String getUserUserAddress() {
    return _appData.read(address) ?? '';
  }

  storeLanguageCode(String value) {
    _appData.write(languageCode, value);
  }

  String getLanguageCode() {
    return _appData.read(languageCode) ?? 'en';
  }

  storeCountryCode(String value) {
    _appData.write(countryCode, value);
  }

  String getCountryCode() {
    return _appData.read(countryCode) ?? 'US';
  }

  storePassword(String value) {
    _appData.write(password, value);
  }

  String getPassword() {
    return _appData.read(password) ?? '';
  }

  storeLoginUser(String value) {
    _appData.write(loginUser, value);
  }

  String getLoginUser() {
    return _appData.read(loginUser) ?? '';
  }

//  /// Address
  storeStateId(String value) {
    _appData.write(stateId, value);
  }

  String getStateID() {
    return _appData.read(stateId) ?? '';
  }

  storeDistrictId(String value) {
    _appData.write(districtId, value);
  }

  String getDistrictID() {
    return _appData.read(districtId) ?? '';
  }

  storeDTalukId(String value) {
    _appData.write(talukId, value);
  }

  String getTalukId() {
    return _appData.read(talukId) ?? '';
  }

  clearData() {
    _appData.remove(userID);
    _appData.erase();
  }
}
