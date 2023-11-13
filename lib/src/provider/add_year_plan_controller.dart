import 'package:flutter/material.dart';
import '../model/get_charity_type_model.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class AddYearPlanController extends ChangeNotifier {
  late String id;
  var loader = false;

  late var selectedDOB = DateTime.now();
  DateTime? savedDOB;
  final trackDistribution = TextEditingController();
  final bibleDistribution = TextEditingController();
  final prayerMeetings = TextEditingController();
  final bibleStudy = TextEditingController();
  final baptisam = TextEditingController();
  final fastingPrayer = TextEditingController();
  final youthFellowship = TextEditingController();
  final womensFellowship = TextEditingController();
  final sundaySchool = TextEditingController();
  final churchCommittee = TextEditingController();
  final receipts = TextEditingController();
  final payments = TextEditingController();
  final charityWorks = TextEditingController();
  final villages = TextEditingController();
  final evangelists = TextEditingController();
  final educationAid = TextEditingController();
  final educationKit = TextEditingController();
  final marriageAid = TextEditingController();
  final widowAid = TextEditingController();
  final disable = TextEditingController();
  final medicalAid = TextEditingController();
  final houseAid = TextEditingController();
  final otherAid = TextEditingController();
  final remark = TextEditingController();

  List<GetCharityType> charityData = <GetCharityType>[];
  var selectedCharityData = '';

  selectDOB(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDOB,
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDOB) {
      selectedDOB = pickedDate;
      savedDOB = selectedDOB;
    }
  }

  getCharityType() async {
    var httpResponse = await ReportService().getCharityType();
    if (!httpResponse.hasError) {
      var data = GetCharityTypeModel.fromMap(httpResponse.response!.data);
      charityData = data.data!;
      loader = false;
      notifyListeners();
    } else {
      loader = true;

      Utils().cancelToast();
      Utils().showToast('something_error');
    }
  }

  void setSelected(String value) {
    selectedCharityData = value;
    notifyListeners();
  }

  onSave() async {
    loader = true;

    Utils.hideKeyboard();

    if (selectedCharityData != "") {
      var httpResponse = await ReportService().yearPlan(
        int.parse(selectedCharityData),
        Utils().convertDateTimeAPI(savedDOB.toString()),
        trackDistribution.text != ""
            ? int.parse(trackDistribution.text.trim())
            : 0,
        bibleDistribution.text != ''
            ? int.parse(bibleDistribution.text.trim())
            : 0,
        prayerMeetings.text != '' ? int.parse(prayerMeetings.text.trim()) : 0,
        bibleStudy.text != '' ? int.parse(bibleStudy.text.trim()) : 0,
        baptisam.text != '' ? int.parse(baptisam.text.trim()) : 0,
        int.parse(id),
        fastingPrayer.text != '' ? int.parse(fastingPrayer.text) : 0,
        youthFellowship.text != '' ? int.parse(youthFellowship.text) : 0,
        womensFellowship.text != '' ? int.parse(womensFellowship.text) : 0,
        sundaySchool.text != '' ? int.parse(sundaySchool.text) : 0,
        churchCommittee.text != '' ? int.parse(churchCommittee.text) : 0,
        receipts.text != '' ? int.parse(receipts.text) : 0,
        payments.text != '' ? int.parse(payments.text) : 0,
        charityWorks.text != '' ? int.parse(charityWorks.text) : 0,
        villages.text != '' ? int.parse(villages.text) : 0,
        evangelists.text != '' ? int.parse(evangelists.text) : 0,
        educationAid.text != '' ? int.parse(educationAid.text) : 0,
        educationKit.text != '' ? int.parse(educationKit.text) : 0,
        marriageAid.text != '' ? int.parse(marriageAid.text) : 0,
        widowAid.text != '' ? int.parse(widowAid.text) : 0,
        disable.text != '' ? int.parse(disable.text) : 0,
        medicalAid.text != '' ? int.parse(medicalAid.text) : 0,
        houseAid.text != '' ? int.parse(houseAid.text) : 0,
        otherAid.text != '' ? int.parse(otherAid.text) : 0,
        remark.text != '' ? remark.text.trim() : '',
      );
      if (!httpResponse.hasError) {
        var code = httpResponse.response!.data['code'];
        if (code == 500) {
          loader = false;
          Utils().showToast(httpResponse.response!.data['message']);
        } else {
          loader = false;
          notifyListeners();
        }
      } else {
        Utils().cancelToast();
        loader = false;
        Utils().showToast('Please_check_your_details');
      }
    } else {
      Utils().cancelToast();
      loader = false;

      Utils().showToast('Please_check_your_details');
    }
  }
}
