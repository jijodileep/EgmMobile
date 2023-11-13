import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/all_member_model.dart';
import '../model/get_gift_type_model.dart';
import '../model/gift_detail_model.dart';
import '../model/object_model.dart';
import '../services/family_service.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class EditGiftRegisterController extends ChangeNotifier {
  late String giftId;

  List<Detail> giftDetails = <Detail>[];
  var giftData = GiftDetailModel();
  var loader = true;
  var btnLoader = false;

  List<MemberData> fastingMembersData = <MemberData>[];
  List<GetGiftType> giftType = <GetGiftType>[];
  List<MemberData> selectedFastingMembersData = <MemberData>[];
  List<int> selectedFastingMembersID = [];

  late var selectedDOB = DateTime.now();
  DateTime? savedDOB;
  var selectedGiftData = "";

  final GlobalKey<FormState> giftRegisterFormKey = GlobalKey<FormState>();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  late String id;

  List<int> selectedGiftKitId = [];
  List<String> selectedGiftKitName = [];

  fetchGift() async {
    loader = true;
    var httpResponse = await ReportService().getChristmasGiftsDetails(giftId);
    if (!httpResponse.hasError) {
      var data = GiftDetailModel.fromMap(httpResponse.response!.data!);
      giftData = data;
      giftDetails = data.data!.details!;
      selectedDOB = giftData.data!.data!.dateTday!;
      selectedGiftData = giftData.data!.data!.giftType!.id.toString();
      for (int i = 0; i < giftDetails.length; i++) {
        selectedFastingMembersID.add(giftDetails[i].memberId!);
      }
      loader = false;
      notifyListeners();
    }
  }

  getMemberData() async {
    loader = true;
    btnLoader = false;
    var httpResponse = await FamilyService().getAllFamilyMembers(id);
    if (!httpResponse.hasError) {
      var data = AllMemberModel.fromMap(httpResponse.response!.data);
      fastingMembersData = data.data!;
      loader = false;

      for (int i = 0; i < selectedFastingMembersID.length; i++) {
        for (int j = 0; j < fastingMembersData.length; j++) {
          if (fastingMembersData[j].id == selectedFastingMembersID[i]) {
            selectedFastingMembersData.add(fastingMembersData[j]);
          }
        }
      }
      notifyListeners();
    } else {
      Utils().cancelToast();
      Utils().showToast('something_error');
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

    var httpResponse = await ReportService().xMasGiftEdit(
        Utils().convertDateTimeAPI(selectedDOB.toString()),
        int.parse(id),
        int.parse(selectedGiftData),
        jsonString,
        'Other',
        int.parse(giftId));
    if (!httpResponse.hasError) {
      btnLoader = false;
      notifyListeners();
    } else {
      btnLoader = false;
    }
  }
}
