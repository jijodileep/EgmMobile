import 'package:egm_developer_mode/src/features/distribution/distribution.dart';
import 'package:egm_developer_mode/src/features/edit_gift_register/edit_gift_register.dart';
import 'package:flutter/material.dart';

import '../model/gift_detail_model.dart';
import '../services/report_service.dart';

class GiftRegisterDetailController extends ChangeNotifier {
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

  toDistribution(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Distribution()),
    );
  }

  toEdit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditGiftRegister()),
    );
  }
}
