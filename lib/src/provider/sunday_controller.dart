import 'package:egm_developer_mode/src/features/add_sunday/add_sunday_screen.dart';
import 'package:egm_developer_mode/src/features/meeting_detail/meeting_detail.dart';
import 'package:flutter/material.dart';
import '../model/sunday_model.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class SundayController extends ChangeNotifier {
  late String id;
  var sundayLoader = true;

  List<Datum> sunday = <Datum>[];

  getSunday() async {
    sundayLoader = true;
    var httpResponse = await ReportService().getSunday(id);
    if (!httpResponse.hasError) {
      var data = SundayModel.fromMap(httpResponse.response!.data);
      sunday = data.data!;
      sundayLoader = false;
      notifyListeners();
    } else {
      sundayLoader = true;
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  toAddReport(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddSundayScreen()),
    );
  }

  toDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MeetingDetail()),
    );
  }
}
