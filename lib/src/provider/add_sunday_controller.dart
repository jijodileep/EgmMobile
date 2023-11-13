import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/all_member_model.dart';
import '../model/get_master_sunday_worships_model.dart';
import '../services/family_service.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class AddSundayController extends ChangeNotifier {
  late String id;
  final GlobalKey<FormState> addSundayFormKey = GlobalKey<FormState>();

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

  var submitAction = false;

  List<GetMasterSundayWorships> getMasterSundayWorshipsModel =
      <GetMasterSundayWorships>[];
  var selectedSundayData = "";

  var screenLoader = true;

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  getMasterSundayWorships() async {
    var httpResponse = await ReportService().getMasterSundayWorships();
    if (!httpResponse.hasError) {
      var data =
          GetMasterSundayWorshipsModel.fromMap(httpResponse.response!.data);
      getMasterSundayWorshipsModel = data.data!;
      screenLoader = false;
    } else {
      screenLoader = true;
      Utils().cancelToast();
      Utils().showToast('something_error');
    }
  }

  getMemberData() async {
    screenLoader = true;

    var httpResponse = await FamilyService().getAllFamilyMembers(id);
    if (!httpResponse.hasError) {
      var data = AllMemberModel.fromMap(httpResponse.response!.data);
      fastingMembersData = data.data!;
      screenLoader = false;
    } else {
      Utils().cancelToast();
      Utils().showToast('something_error');
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

  onCreate() async {
    Utils.hideKeyboard();
    if (addSundayFormKey.currentState!.validate()) {
      if (selectedSundayData != '') {
        submitAction = true;

        String numbersAsString = selectedGiftKitName.join(', ');

        var httpResponse = await ReportService().postSundayWorship(
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
            paymentController.text != ''
                ? int.parse(paymentController.text)
                : 0,
            receiptsController.text != ''
                ? int.parse(receiptsController.text)
                : 0,
            childrenController.text != ''
                ? int.parse(childrenController.text)
                : 0,
            numbersAsString,
            attendance);
        if (!httpResponse.hasError) {
          submitAction = false;
          notifyListeners();
        } else {
          Utils().cancelToast();
          submitAction = false;
          var data = httpResponse.dioError.response!.data['errors'];
          Utils().showToast(data.toString());
        }
      } else {
        Utils().cancelToast();
        submitAction = false;
        Utils().showToast('PleaseSelectDropdown');
      }
    } else {
      Utils().cancelToast();
      submitAction = false;
      Utils().showToast('Please_check_your_details');
    }
  }
}
