import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/all_member_model.dart';
import '../model/get_master_sunday_worships_model.dart';
import '../model/meeting_detail_model.dart';
import '../services/family_service.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

// : if  they need edit controller values set to just copy add sunday UI new elements children attendance member and change the api service code

class EditMeetingController extends ChangeNotifier {
  late String editId;

  bool screenLoader = true;

  var modelData = MeetingDetailModel();

  late String id;
  final GlobalKey<FormState> editSundayFormKey = GlobalKey<FormState>();

  late var selectedDOB = DateTime.now();

  final reasonController = TextEditingController();
  final baptizedBelieversController = TextEditingController();
  final nonBaptizedBelieversController = TextEditingController();
  final evangelistController = TextEditingController();
  final guestsController = TextEditingController();
  final offerAmountController = TextEditingController();
  final worshipExpenseAmountController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final receiptsController = TextEditingController();
  final paymentController = TextEditingController();
  final childrenController = TextEditingController();

  bool attendance = false;

  List<MemberData> fastingMembersData = <MemberData>[];
  List<String> selectedGiftKitName = [];

  var updateAction = false;

  List<GetMasterSundayWorships> getMasterSundayWorshipsModel =
      <GetMasterSundayWorships>[];
  var selectedSundayData = "";

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  getMasterSundayWorships() async {
    var httpResponse = await ReportService().getMasterSundayWorships();
    if (!httpResponse.hasError) {
      var data =
          GetMasterSundayWorshipsModel.fromMap(httpResponse.response!.data);
      getMasterSundayWorshipsModel = data.data!;
      screenLoader = false;
      notifyListeners();
    } else {
      screenLoader = true;
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  getMemberData() async {
    screenLoader = true;

    var httpResponse = await FamilyService().getAllFamilyMembers(id);
    if (!httpResponse.hasError) {
      var data = AllMemberModel.fromMap(httpResponse.response!.data);
      fastingMembersData = data.data!;
      screenLoader = false;
      notifyListeners();
    } else {
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  fetchDetail() async {
    var httpResponse = await ReportService().getSundayDetails(editId);
    if (!httpResponse.hasError) {
      var data = MeetingDetailModel.fromMap(httpResponse.response!.data);
      modelData = data;
      selectedDOB = modelData.data!.dateTday!;

      reasonController.text = modelData.data!.reason.toString();
      baptizedBelieversController.text =
          modelData.data!.baptizedBelievers.toString();
      nonBaptizedBelieversController.text =
          modelData.data!.nonbaptizedBelievers.toString();
      evangelistController.text = modelData.data!.evangelists.toString();
      guestsController.text = modelData.data!.guests.toString();
      offerAmountController.text = modelData.data!.offertoryAmount.toString();
      worshipExpenseAmountController.text =
          modelData.data!.worshipExpenseAmount.toString();
      startController.text = modelData.data!.startTime.toString();
      endController.text = modelData.data!.endTime.toString();
      receiptsController.text = modelData.data!.receipts.toString();
      paymentController.text = modelData.data!.payment.toString();
      selectedSundayData = modelData.data!.masterSundayWorshipId.toString();
      childrenController.text = modelData.data!.children.toString();
      attendance = modelData.data!.isAttendance!;
      screenLoader = false;
      notifyListeners();
    } else {
      screenLoader = true;
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  void setSelected(String value) {
    selectedSundayData = value;
    notifyListeners();
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

  onUpdate() async {
    Utils.hideKeyboard();
    if (editSundayFormKey.currentState!.validate()) {
      if (selectedSundayData != '') {
        updateAction = true;
        var httpResponse = await ReportService().editSundayWorship(
          Utils().convertDateTimeAPI(selectedDOB.toString()),
          reasonController.text.trim(),
          baptizedBelieversController.text != ''
              ? int.parse(baptizedBelieversController.text.trim())
              : 0,
          baptizedBelieversController.text != ''
              ? int.parse(baptizedBelieversController.text.trim())
              : 0,
          evangelistController.text != ''
              ? int.parse(evangelistController.text.trim())
              : 0,
          guestsController.text != ''
              ? int.parse(guestsController.text.trim())
              : 0,
          startController.text.trim(),
          endController.text.trim(),
          offerAmountController.text != ''
              ? int.parse(offerAmountController.text.trim())
              : 0,
          worshipExpenseAmountController.text != ''
              ? int.parse(worshipExpenseAmountController.text.trim())
              : 0,
          int.parse(id),
          int.parse(selectedSundayData),
          paymentController.text != '' ? int.parse(paymentController.text) : 0,
          receiptsController.text != ''
              ? int.parse(receiptsController.text)
              : 0,
          int.parse(editId),
        );
        if (!httpResponse.hasError) {
          updateAction = false;
          notifyListeners();
        } else {
          Utils().cancelToast();
          updateAction = false;
          var data = httpResponse.dioError.response!.data['errors'];
          Utils().showToast(data.toString());
          notifyListeners();
        }
      } else {
        Utils().cancelToast();
        updateAction = false;
        Utils().showToast('PleaseSelectDropdown');
        notifyListeners();
      }
    } else {
      Utils().cancelToast();
      updateAction = false;
      Utils().showToast('Please_check_your_details');
      notifyListeners();
    }
  }
}
