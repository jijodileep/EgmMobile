import 'package:flutter/material.dart';

import '../services/report_service.dart';
import '../utils/utils.dart';

class AddPrayerRequestController extends ChangeNotifier {
  late String id;
  final GlobalKey<FormState> addPrayerRequestFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  var submitAction = false;

  onCreate() async {
    Utils.hideKeyboard();
    if (addPrayerRequestFormKey.currentState!.validate()) {
      submitAction = true;
      var httpResponse = await ReportService().createPrayer(
          nameController.text.trim(),
          descriptionController.text.trim(),
          int.parse(id),
          'PrayerRequest');
      if (!httpResponse.hasError) {
        notifyListeners();
        submitAction = false;
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
