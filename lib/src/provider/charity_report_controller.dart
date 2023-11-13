import 'package:egm_developer_mode/src/features/add_charity_report/add_charity_report_screen.dart';
import 'package:egm_developer_mode/src/features/charity_report_details/charity_report_details_screen.dart';
import 'package:flutter/material.dart';
import '/src/services/report_service.dart';
import '../utils/utils.dart';
import '../model/charity_model.dart';

class CharityReportController extends ChangeNotifier {
  var yearLoader = true;
  late String id;

  List<Datum> year = <Datum>[];

  getYear() async {
    yearLoader = true;
    var httpResponse = await ReportService().getProgramsEntry(id);
    if (!httpResponse.hasError) {
      var data = CharityModel.fromMap(httpResponse.response!.data);
      year = data.data!;
      yearLoader = false;
      notifyListeners();
    } else {
      yearLoader = true;
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  // navigation
  toAddReport(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddCharityReportScreen()),
    );
  }

  toReportDetails(id, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const CharityReportDetailScreen()),
    );
  }
}
