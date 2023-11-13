import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class AddPrayerController extends ChangeNotifier {
  late String id;
  final GlobalKey<FormState> addPrayerFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  var submitAction = false;

  void onStart() {
    id = AppData().getUserID();
    submitAction = false;
  }

  onCreate() async {
    Utils.hideKeyboard();
    if (addPrayerFormKey.currentState!.validate()) {
      submitAction = true;
      var httpResponse = await ReportService().createPrayer(
          nameController.text.trim(),
          descriptionController.text.trim(),
          int.parse(id),
          'OfficeCommunications');
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
      Utils().showToast('Please_check_your_details');
    }
  }
}
