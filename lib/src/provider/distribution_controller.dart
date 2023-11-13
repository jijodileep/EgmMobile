import 'package:flutter/material.dart';
import '../model/gift_detail_model.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class DistributionController extends ChangeNotifier {
  late String giftId;
  var loader = true;
  bool btnLoader = false;
  String? mId;

  List<Detail> giftDetails = <Detail>[];
  var giftData = GiftDetailModel();
  List<CustomCheckList> customCheckList = [];

  fetchGift() async {
    loader = true;
    var httpResponse = await ReportService().getChristmasGiftsDetails(giftId);
    if (!httpResponse.hasError) {
      var data = GiftDetailModel.fromMap(httpResponse.response!.data!);
      giftData = data;
      giftDetails = data.data!.details!;
      loader = false;
      for (var i in giftDetails) {
        customCheckList.add(CustomCheckList(
            userId: i.memberId,
            status: i.description == 'False' || i.description == 'false'
                ? false
                : true,
            userName: i.familyMember!.name,
            dataId: i.id));
      }
      notifyListeners();
    }
  }

  distribution() async {
    btnLoader = true;
    String jsonString = '[';
    for (var i = 0; i < giftDetails.length; i++) {
      // ignore: prefer_interpolation_to_compose_strings
      jsonString = jsonString +
          '{' +
          '"memberID"' +
          ":" +
          '[' +
          customCheckList[i].userId.toString() +
          '],' +
          '"id"' +
          ":" +
          '"' +
          customCheckList[i].dataId.toString() +
          '",'
              '"description":"' +
          '${customCheckList[i].status}",' +
          '"type":' +
          '"Other"},';
    }

    jsonString = jsonString.substring(0, jsonString.length - 1);

    jsonString = '$jsonString]';

    var httpResponse = await ReportService().xMasGiftUpdate(
        Utils().convertDateTimeAPI(giftData.data!.data!.dateTday!.toString()),
        int.parse(mId!),
        giftData.data!.data!.giftTypeID!,
        jsonString,
        'Other',
        giftData.data!.data!.id);
    if (!httpResponse.hasError) {
      btnLoader = false;
      notifyListeners();
    } else {
      btnLoader = false;
      notifyListeners();
    }
  }
}

class CustomCheckList {
  int? userId;
  bool? status;
  String? userName;
  int? dataId;
  CustomCheckList({
    required this.userId,
    required this.status,
    required this.userName,
    required this.dataId,
  });
}
