import 'package:egm_developer_mode/src/features/add_comment/add_comment.dart';
import 'package:flutter/material.dart';
import '../model/prayer_detail_model.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class PrayerDetailsController extends ChangeNotifier {
  late String detailId;

  var data = DataData();
  List<Comment> comment = <Comment>[];

  var screenLoad = true;

  getDetails() async {
    var httpResponse = await ReportService().getPrayerDetail(detailId);
    if (!httpResponse.hasError) {
      var response = PrayerDetailModel.fromMap(httpResponse.response!.data);
      data = response.data!.data!;
      comment = response.data!.comments!;
      screenLoad = false;
      notifyListeners();
    } else {
      screenLoad = true;
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  toComment(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddComment()),
    );
  }
}
