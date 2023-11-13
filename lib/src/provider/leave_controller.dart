import 'package:egm_developer_mode/src/features/add_leave/add_leave.dart';
import 'package:flutter/material.dart';
import '../model/leave_model.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class LeaveController extends ChangeNotifier {
  late String id;
  var leaveLoader = true;
  List<Datum> leave = <Datum>[];

  getLeave() async {
    leaveLoader = true;
    var httpResponse = await ReportService().getLeave(id);
    if (!httpResponse.hasError) {
      var data = LeaveModel.fromMap(httpResponse.response!.data);
      leave = data.data!;
      leaveLoader = false;
      notifyListeners();
    } else {
      leaveLoader = true;
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  toAddReport(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddLeave()),
    );
  }
}
