import 'package:flutter/material.dart';
import '/src/services/report_service.dart';
import '../utils/utils.dart';
import '../model/charity_details_model.dart';

class CharityReportDetailsController extends ChangeNotifier {
  int? reportId;

  var reportLoader = true;

  var yearData = Data();

  getReport() async {
    reportLoader = true;
    var httpResponse =
        await ReportService().programEntryDetails(reportId.toString());
    if (!httpResponse.hasError) {
      var data = CharityDetailsModel.fromMap(httpResponse.response!.data);
      yearData = data.data!;
      reportLoader = false;
      notifyListeners();
    } else {
      Utils().cancelToast();
      Utils().showToast('something_error');
      reportLoader = true;
      notifyListeners();
    }
  }
}
