import 'package:egm_developer_mode/src/features/add_prayer_request/add_prayer_request.dart';
import 'package:flutter/material.dart';
import '../model/prayer_request_model.dart';
import '../services/report_service.dart';

class PrayerRequestAdminController extends ChangeNotifier {
  late String id;
  var prayerLoader = true;

  List<RequestData> prayerRequest = <RequestData>[];

  requestPrayer() async {
    prayerLoader = true;
    var httpResponse =
        await ReportService().allRequestPrayer(id, 'PrayerRequest');
    if (!httpResponse.hasError) {
      var data = PrayerRequestModel.fromMap(httpResponse.response!.data!);
      prayerRequest = data.data!;

      prayerLoader = false;
      notifyListeners();
    } else {
      prayerLoader = true;
      notifyListeners();
    }
  }

  toAddReport(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPrayerRequest()),
    );
  }
}
