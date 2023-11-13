import 'package:flutter/material.dart';
import '../model/daily_report_model.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';
import 'package:egm_developer_mode/src/features/add_daily_report/add_daily_report_screen.dart';
import 'package:egm_developer_mode/src/features/daily_detail/daily_detail.dart';

class DailyReportController extends ChangeNotifier {
  late String id;

  DailyReportModel? dailyReportModel;
  List<DailyReportData> dailyReportData = <DailyReportData>[];

  var dailyEntryLoader = true;

  var selectedYear = 2023;
  var selectedMonth = 3;
  String? date;

  getDailyEntry(int month, int year) async {
    dailyEntryLoader = true;
    var httpResponse = await ReportService().getDailyReport(id, month, year);
    if (httpResponse == 200) {
      dailyReportData = dailyReportModel!.data!;
      dailyEntryLoader = false;
      notifyListeners();
    } else {
      dailyEntryLoader = true;
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  toAddReport(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddDailyReportScreen()),
    );
  }

  toDetails(String id, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DailyDetail()),
    );
  }
}
