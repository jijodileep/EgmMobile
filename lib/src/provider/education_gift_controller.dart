import 'package:egm_developer_mode/src/features/add_gift/add_gift.dart';
import 'package:egm_developer_mode/src/features/gift_detail/gift_detail.dart';
import 'package:flutter/material.dart';

import '../model/gift_model.dart';
import '../services/report_service.dart';

class EducationGiftController extends ChangeNotifier {
  late String mID;
  var loader = true;

  List<Datum> giftData = <Datum>[];

  getGift() async {
    loader = true;
    var httpResponse =
        await ReportService().getChristmasGifts(mID, 'EducationalKIT');
    if (!httpResponse.hasError) {
      var data = GiftModel.fromMap(httpResponse.response!.data!);
      giftData = data.data!;
      loader = false;
      notifyListeners();
    }
  }

  toAddGift(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddGift()),
    );
  }

  toDetail(String giftId, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GiftDetail()),
    );
  }
}
