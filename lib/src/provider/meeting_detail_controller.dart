import 'package:egm_developer_mode/src/features/edit_meeting/edit_meeting.dart';
import 'package:flutter/material.dart';
import '../model/meeting_detail_model.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class MeetingDetailController extends ChangeNotifier {
  late String editId;

  bool screenLoader = true;

  var modelData = MeetingDetailModel();

  fetchDetail() async {
    var httpResponse = await ReportService().getSundayDetails(editId);
    if (!httpResponse.hasError) {
      var data = MeetingDetailModel.fromMap(httpResponse.response!.data);
      modelData = data;
      screenLoader = false;
      notifyListeners();
    } else {
      screenLoader = true;
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  toEdit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditMeeting()),
    );
  }
}
