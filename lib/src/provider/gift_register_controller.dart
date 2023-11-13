import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/all_member_model.dart';
import '../model/get_gift_type_model.dart';
import '../model/object_model.dart';
import '../services/family_service.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class GiftRegisterController extends ChangeNotifier {
  late String id;

  var loader = true;
  var btnLoader = false;

  List<MemberData> fastingMembersData = <MemberData>[];
  List<GetGiftType> giftType = <GetGiftType>[];

  late var selectedDOB = DateTime.now();
  DateTime? savedDOB;

  var selectedGiftData = "";

  final GlobalKey<FormState> giftRegisterFormKey = GlobalKey<FormState>();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  List<int> selectedGiftKitId = [];
  List<String> selectedGiftKitName = [];

  getMemberData() async {
    loader = true;
    btnLoader = false;
    var httpResponse = await FamilyService().getAllFamilyMembers(id);
    if (!httpResponse.hasError) {
      var data = AllMemberModel.fromMap(httpResponse.response!.data);
      fastingMembersData = data.data!;
      loader = false;
      notifyListeners();
    } else {
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  getGiftType() async {
    loader = true;
    var httpResponse = await ReportService().getGiftType();
    if (!httpResponse.hasError) {
      var data = GetGiftTypeModel.fromMap(httpResponse.response!.data);
      giftType = data.data!;
      loader = false;
      notifyListeners();
    } else {
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  selectDOB(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDOB,
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDOB) {
      selectedDOB = pickedDate;
      savedDOB = selectedDOB;
      notifyListeners();
    }
  }

  void setSelectedGift(String value) {
    selectedGiftData = value;
    notifyListeners();
  }

  onValidate() async {
    if (selectedGiftData != '' && selectedGiftKitId.isNotEmpty) {
      registerAction();
    } else {
      Utils().cancelToast();
      btnLoader = false;
      Utils().showToast('Please_check_your_details');
      notifyListeners();
    }
  }

  registerAction() async {
    btnLoader = true;
    Utils.hideKeyboard();
    List<ObjectModel> modelList = [];
    String jsonString = '[';
    for (var i = 0; i < selectedGiftKitId.length; i++) {
      // ignore: prefer_interpolation_to_compose_strings
      jsonString = jsonString +
          '{' +
          '"memberID"' +
          ":" +
          '[' +
          selectedGiftKitId[i].toString() +
          '],' +
          '"description":"' +
          'False",' +
          '"type":' +
          '"Other"},';
      modelList.add(ObjectModel(
          memberID: [selectedGiftKitId[i]],
          description: 'False',
          type: 'EducationalKIT'));
    }
    jsonString = jsonString.substring(0, jsonString.length - 1);

    jsonString = '$jsonString]';

    var httpResponse = await ReportService().xMasGift(
        Utils().convertDateTimeAPI(savedDOB.toString()),
        int.parse(id),
        int.parse(selectedGiftData),
        jsonString,
        'Other');
    if (!httpResponse.hasError) {
      btnLoader = false;
      notifyListeners();
    } else {
      btnLoader = false;
      notifyListeners();
    }
  }
}
