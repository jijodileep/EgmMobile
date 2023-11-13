import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class AddCommentController extends ChangeNotifier {
  int? prayerId;
  late String missId;

  final GlobalKey<FormState> addCommentFormKey = GlobalKey<FormState>();
  final commentTextController = TextEditingController();

  var btnLoader = false;

  void onStart() {
    prayerId = 0;
    missId = AppData().getUserID();
  }

  onCreate() async {
    if (addCommentFormKey.currentState!.validate()) {
      Utils.unFocus();
      Utils.hideKeyboard();
      btnLoader = true;
      var httpResponse = await ReportService().createComment(
          int.parse(missId), commentTextController.text.trim(), prayerId!);
      if (httpResponse == 200) {
        notifyListeners();
        btnLoader = false;
      } else {
        Utils().cancelToast();
        btnLoader = false;
        var data = httpResponse.dioError.response!.data['errors'];
        Utils().showToast(data.toString());
      }
    } else {
      Utils().cancelToast();
      btnLoader = false;
      Utils().showToast('Please_check_your_details');
    }
  }
}
