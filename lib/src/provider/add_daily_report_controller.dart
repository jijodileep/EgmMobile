import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/app_data.dart';
import '../model/all_family_model.dart';
import '../model/all_village_model.dart';
import '../model/center_model.dart';
import '../model/state_model.dart';
import '../services/family_service.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class AddDailyReportController extends ChangeNotifier {
  late String id;
  var addDailyReportLoader = false;
  final GlobalKey<FormState> addDailyReportFormKey = GlobalKey<FormState>();
  var submitAction = false;

  late var selectedDOB = DateTime.now();
  DateTime? savedDOB;

  final reasonController = TextEditingController();

  List<StateData> stateData = <StateData>[];
  late int selectedState;

  final distanceController = TextEditingController();
  final receiptsController = TextEditingController();
  final paymentsController = TextEditingController();

  final fastingPrayer = TextEditingController();
  final youthFellowship = TextEditingController();
  final womenFellowship = TextEditingController();
  final cottageMeeting = TextEditingController();
  final churchCommittee = TextEditingController();
  final sundaySchool = TextEditingController();

  List<CenterData> centerData = <CenterData>[];
  late String selectedCenter;

  List<VillageData> villageData = <VillageData>[];
  List<int> selectedVillages = [];

  var familyData = <FamilyData>[];
  List<int> selectedHouses = [];

  final tractDistribution = TextEditingController();
  final bibleDistribution = TextEditingController();
  final prayerMeetings = TextEditingController();
  final bibleStudy = TextEditingController();
  final baptism = TextEditingController();

  bool isLeave = false;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  int? talukID;

  void onStart() {
    talukID = int.parse(AppData().getTalukId());
    id = AppData().getUserID();
    selectedState = int.parse(AppData().getStateID());
    selectedCenter = AppData().getUserUserCategoryId();
    selectedDOB = dateFormat.parse(DateTime.now().toString());
    savedDOB = dateFormat.parse(DateTime.now().toString());
    isLeave = false;
    getCommonData();
    notifyListeners();
  }

  getCommonData() async {
    addDailyReportLoader = true;
    getVillageData();
    getHouseData();
    addDailyReportLoader = false;
    notifyListeners();
  }

  getVillageData() async {
    var httpResponse = await FamilyService().getVillage(talukID.toString());
    if (httpResponse.hasError) {
      var villageModel = AllVillageModel.fromMap(httpResponse.response!.data);
      villageData = villageModel.data!;
      notifyListeners();
    } else {
      Utils().cancelToast();
      Utils().showToast('something_error');
    }
  }

  getHouseData() async {
    var httpResponse = await FamilyService().getAllFamily(id);
    if (!httpResponse.hasError) {
      var data = AllFamilyModel.fromMap(httpResponse.response!.data);
      familyData = data.data!;
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

  onCreate() async {
    Utils.unFocus();
    Utils.hideKeyboard();
    if (addDailyReportFormKey.currentState!.validate()) {
      submitAction = true;
      if (savedDOB != null) {
        var date = Utils().convertDateTimeDisplay(savedDOB.toString());

        var httpResponse = await ReportService().addDailyEntry(
            date,
            isLeave,
            reasonController.text == "" ? '""' : reasonController.text.trim(),
            selectedState,
            int.parse(id),
            selectedVillages.length,
            selectedHouses.length,
            distanceController.text != ''
                ? int.parse(distanceController.text.trim())
                : 0,
            receiptsController.text != ''
                ? int.parse(receiptsController.text.trim())
                : 0,
            paymentsController.text != ''
                ? int.parse(paymentsController.text.trim())
                : 0,
            selectedCenter.toString(),
            fastingPrayer.text == '' ? 0 : int.parse(fastingPrayer.text),
            youthFellowship.text == '' ? 0 : int.parse(youthFellowship.text),
            womenFellowship.text == '' ? 0 : int.parse(womenFellowship.text),
            cottageMeeting.text == '' ? 0 : int.parse(cottageMeeting.text),
            sundaySchool.text == '' ? 0 : int.parse(sundaySchool.text),
            churchCommittee.text == '' ? 0 : int.parse(churchCommittee.text),
            selectedVillages.isEmpty ? [0] : selectedVillages,
            selectedHouses.isEmpty ? [0] : selectedHouses,
            tractDistribution.text == ''
                ? 0
                : int.parse(tractDistribution.text),
            bibleDistribution.text == ''
                ? 0
                : int.parse(bibleDistribution.text),
            prayerMeetings.text == '' ? 0 : int.parse(prayerMeetings.text),
            bibleStudy.text == '' ? 0 : int.parse(bibleStudy.text),
            baptism.text == '' ? 0 : int.parse(baptism.text));

        if (httpResponse == 200) {
          var code = httpResponse;
          if (code == 500) {
            submitAction = false;
          } else {
            notifyListeners();
            submitAction = false;
          }
        } else {
          Utils().cancelToast();
          submitAction = false;
        }
      } else {
        Utils().cancelToast();
        submitAction = false;
        Utils().showToast('SelectDate');
      }
    } else {
      Utils().cancelToast();
      submitAction = false;
      Utils().showToast('Please_check_your_details');
    }
  }
}
