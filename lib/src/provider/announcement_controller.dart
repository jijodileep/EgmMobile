import 'package:flutter/material.dart';

import '../model/prayer_request_model.dart';
import '../services/report_service.dart';

class AnnouncementController extends ChangeNotifier {
  bool screenLoader = false;
  late String id;

  List<RequestData> prayerRequest = <RequestData>[];

  requestPrayer() async {
    screenLoader = true;
    var httpResponse =
        await ReportService().allRequestPrayer(id, 'Announcement');
    if (!httpResponse.hasError) {
      var data = PrayerRequestModel.fromMap(httpResponse.response!.data!);
      prayerRequest = data.data!;
      screenLoader = false;
      notifyListeners();
    } else {
      screenLoader = true;
    }
  }
}
