import 'package:flutter/material.dart';

import '../model/gift_detail_model.dart';
import '../services/report_service.dart';

class GiftDetailController extends ChangeNotifier {
  late String giftId;
  var loader = true;

  List<Detail> giftDetails = <Detail>[];
  var giftData = GiftDetailModel();

  fetchGift() async {
    loader = true;
    var httpResponse = await ReportService().getChristmasGiftsDetails(giftId);
    if (!httpResponse.hasError) {
      var data = GiftDetailModel.fromMap(httpResponse.response!.data!);
      giftData = data;
      giftDetails = data.data!.details!;
      loader = false;
      notifyListeners();
    }
  }
}
