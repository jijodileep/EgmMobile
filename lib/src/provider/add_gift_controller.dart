import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../data/app_data.dart';
import '../model/all_member_model.dart';
import '../model/get_gift_type_model.dart';
import '../model/object_model.dart';
import '../services/family_service.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class AddGiftController extends ChangeNotifier {
  late String id;

  var loader = true;

  List<MemberData> fastingMembersData = <MemberData>[];
  List<GetGiftType> giftType = <GetGiftType>[];

  List<int> selectedGiftKitId = [];
  List<String> selectedGiftKitName = [];

  List<TextEditingController>? textControllers = [];

  late var selectedDOB = DateTime.now();
  DateTime? savedDOB;

  var btnLoader = false;
  var saveLoader = false;

  var selectedGiftData = "";
  var secondPhase = false;
  GlobalKey<FormState> addGiftFormKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  void onStart() {
    secondPhase = false;
    saveLoader = false;
    selectedDOB = dateFormat.parse(DateTime.now().toString());
    savedDOB = DateTime.now();
    id = AppData().getUserID();
    getMemberData();
    getGiftType();
  }

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
    }
  }

  getGiftType() async {
    loader = true;
    var dioResponse = await ReportService().getGiftType();
    if (!dioResponse.hasError) {
      var data = GetGiftTypeModel.fromMap(dioResponse.response!.data);
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
      savedDOB = selectedDOB;
      notifyListeners();
    }
  }

  void setSelectedGift(String value) {
    selectedGiftData = value;
    notifyListeners();
  }

  onCreate() async {
    if (addGiftFormKey.currentState!.validate()) {
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
            '${textControllers![i].text}",' +
            '"type":' +
            '"EducationalKIT"},';
        modelList.add(ObjectModel(
            memberID: [selectedGiftKitId[i]],
            description: textControllers![i].text,
            type: 'EducationalKIT'));
      }

      jsonString = jsonString.substring(0, jsonString.length - 1);

      jsonString = '$jsonString]';

// Print or use the JSON string as needed

      var httpResponse = await ReportService().xMasGift(
          Utils().convertDateTimeAPI(savedDOB.toString()),
          int.parse(id),
          int.parse(selectedGiftData),
          jsonString,
          'EducationalKIT');

      if (!httpResponse.hasError) {
        notifyListeners();
        btnLoader = false;
      } else {
        btnLoader = false;
      }
    } else {
      Utils().cancelToast();
      btnLoader = false;
      Utils().showToast('Please_check_your_details');
    }
  }

  onValidate() async {
    if (selectedGiftData != '' && selectedGiftKitId.isNotEmpty) {
      secondPhase = true;
    } else {
      Utils().cancelToast();
      btnLoader = false;
      Utils().showToast('Please_check_your_details');
    }
  }
}
