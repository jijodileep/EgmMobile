import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class AddLeaveController extends ChangeNotifier {
  late String id;
  final GlobalKey<FormState> addLeaveFormKey = GlobalKey<FormState>();

  late var selectedDOB = DateTime.now();
  var submitAction = false;
  final reasonController = TextEditingController();

  void onStart() {
    id = AppData().getUserID();
    selectedDOB = DateTime.now();
    submitAction = false;
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
    submitAction = true;
    if (addLeaveFormKey.currentState!.validate()) {
      var httpResponse = await ReportService().leaveCall(
          Utils().convertDateTimeDisplay(selectedDOB.toString()),
          reasonController.text.trim(),
          id);
      if (!httpResponse.hasError) {
        submitAction = false;
        notifyListeners();
      } else {
        Utils().cancelToast();
        submitAction = false;
        Utils().showToast('Please_check_your_details');
      }
    } else {
      Utils().cancelToast();
      submitAction = false;
      Utils().showToast('Please_check_your_details');
    }
  }
}
