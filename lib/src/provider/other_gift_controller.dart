import 'package:egm_developer_mode/src/features/gift_register/gift_register.dart';
import 'package:egm_developer_mode/src/features/gift_register_detail/gift_register_detail.dart';
import 'package:flutter/material.dart';
import '../model/gift_model.dart';
import '../services/report_service.dart';

class OtherGiftController extends ChangeNotifier {
  late String mID;
  var loader = true;

  List<Datum> giftData = <Datum>[];

  getGift() async {
    loader = true;
    var httpResponse = await ReportService().getChristmasGifts(mID, 'Other');
    if (!httpResponse.hasError) {
      var data = GiftModel.fromMap(httpResponse.response!.data!);
      giftData = data.data!;
      loader = false;
    }
  }

  toAddGift(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GiftRegister()),
    );
  }

  toDetail(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GiftRegisterDetail()),
    );
  }
}
