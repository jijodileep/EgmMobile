import 'package:egm_developer_mode/src/features/add_prayer/add_prayer_screen.dart';
import 'package:egm_developer_mode/src/features/prayer_detail/prayer_detail.dart';
import 'package:flutter/material.dart';
import '../model/prayer_request_model.dart';
import '../services/report_service.dart';

class PrayerController extends ChangeNotifier {
  late String id;
  var prayerLoader = true;

  List<RequestData> prayerRequest = <RequestData>[];

  requestPrayer() async {
    prayerLoader = true;
    var httpResponse =
        await ReportService().allRequestPrayer(id, 'OfficeCommunications');
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
      MaterialPageRoute(builder: (context) => const AddPrayerScreen()),
    );
  }

  toDetails(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PrayerDetail()),
    );
  }
}
