import 'package:flutter/material.dart';

import '../model/daily_details_model.dart';
import '../services/report_service.dart';

class DailyDetailController extends ChangeNotifier {
  late String detailId;
  var loader = true;

  List<Datum> data = <Datum>[];
  List<Detail> details = <Detail>[];
  List<House> houses = <House>[];
  List<VillageElement> villages = <VillageElement>[];

  getDetail() async {
    loader = true;
    var httpResponse = await ReportService().getDailyReportDetails(detailId);
    if (!httpResponse.hasError) {
      var dailyDetailsModel =
          DailyDetailsModel.fromMap(httpResponse.response!.data!);
      data = dailyDetailsModel.data!.data!;
      details = dailyDetailsModel.data!.details!;
      houses = dailyDetailsModel.data!.houses!;
      villages = dailyDetailsModel.data!.villages!;
      loader = false;
      notifyListeners();
    } else {
      loader = true;
      notifyListeners();
    }
  }
}
