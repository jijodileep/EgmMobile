import 'package:egm_developer_mode/src/api/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/app_data.dart';
import '../model/get_charity_type_model.dart';
import '../services/report_service.dart';
import '../utils/utils.dart';

class AddCharityReportController extends ChangeNotifier {
  late String id;
  final GlobalKey<FormState> addYearReportFormKey = GlobalKey<FormState>();

  late var selectedDOB = DateTime.now();
  DateTime? savedDOB;

  // RxList<MemberData> membersData = <MemberData>[].obs;
  List<GetCharityType> charityData = <GetCharityType>[];
  var selectedCharityData = "";

  final reasonController = TextEditingController();
  final trackController = TextEditingController();
  final bibleController = TextEditingController();
  final prayerController = TextEditingController();
  final bibleStudyController = TextEditingController();
  final baptismMeetingController = TextEditingController();

  bool fastingPrayer = false;
  bool youthFellowship = false;
  bool womenFellowship = false;
  bool cottageMeeting = false;
  bool sundaySchool = false;
  bool churchCommittee = false;
  bool christmasGiftsDistribution = false;

  List<int> selectedEducationAid = [];
  bool educationAid = false;

  List<int> selectedEducationKit = [];
  bool educationKit = false;

  List<int> selectedMarriageAid = [];
  bool marriageAid = false;

  List<int> selectedWidowAid = [];
  bool widowAid = false;

  List<int> selectedAidDifferentlyAbled = [];
  bool aidDifferentlyAbled = false;

  List<int> selectedMedicalAid = [];
  bool medicalAid = false;

  List<int> selectedHouseConstructionAid = [];
  bool houseConstructionAid = false;

  List<int> selectedOtherAid = [];
  bool otherAid = false;

  final cottageNoOfCharityWorksController = TextEditingController();
  final cottageNoOfNewVillagesController = TextEditingController();
  final cottageNoOfNewEvangelistsController = TextEditingController();
  final cottageTotalReceiptsExpensesController = TextEditingController();
  final cottagePrayerRequestsController = TextEditingController();

  var submitAction = false;
  var screenLoader = true;

  final educationController = TextEditingController();
  final educationKidsController = TextEditingController();
  final marriageAidController = TextEditingController();
  final widowAidController = TextEditingController();
  final differentlyController = TextEditingController();
  final medicalController = TextEditingController();
  final houseController = TextEditingController();
  final otherController = TextEditingController();
  final receiptsController = TextEditingController();
  final paymentController = TextEditingController();
  final remarkController = TextEditingController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

// provider init state and auto start method call
  void init() {
    screenLoader = true;
    id = AppData().getUserID();
    selectedDOB = dateFormat.parse(DateTime.now().toString());
    savedDOB = null;
    fastingPrayer = false;
    youthFellowship = false;
    womenFellowship = false;
    cottageMeeting = false;
    churchCommittee = false;
    christmasGiftsDistribution = false;
    educationAid = false;
    educationKit = false;
    marriageAid = false;
    widowAid = false;
    aidDifferentlyAbled = false;
    medicalAid = false;
    houseConstructionAid = false;
    otherAid = false;
    getCharityType();
    submitAction = false;
  }

  getCharityType() async {
    HttpsConfig httpResponse = await ReportService().getCharityType();
    var data =
        GetCharityTypeModel.fromMap(httpResponse as Map<String, dynamic>);
    charityData = data.data!;
    screenLoader == false;
  }

  void setSelected(String value) {
    selectedCharityData = value;
    notifyListeners();
  }

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
      notifyListeners();
    }
  }

  onCreate() async {
    Utils.unFocus();
    Utils.hideKeyboard();

    if (addYearReportFormKey.currentState!.validate()) {
      submitAction = true;
      notifyListeners();

      HttpResponse httpResponse = await ReportService().programsEntry(
        Utils().convertDateTimeAPI(selectedDOB.toString()),
        reasonController.text != '' ? reasonController.text.trim() : '',
        // '',
        trackController.text != '' ? int.parse(trackController.text.trim()) : 0,
        bibleController.text != '' ? int.parse(bibleController.text.trim()) : 0,
        prayerController.text != ''
            ? int.parse(prayerController.text.trim())
            : 0,
        bibleStudyController.text != ''
            ? int.parse(bibleStudyController.text.trim())
            : 0,
        baptismMeetingController.text != ''
            ? int.parse(baptismMeetingController.text.trim())
            : 0,
        fastingPrayer,
        youthFellowship,
        womenFellowship,
        cottageMeeting,
        sundaySchool,
        churchCommittee,
        christmasGiftsDistribution,
        int.parse(id),
        // selectedEducationAid.length,
        educationController.text != ''
            ? int.parse(educationController.text.trim())
            : 0,
        // selectedEducationKit.length,
        educationKidsController.text != ''
            ? int.parse(educationKidsController.text.trim())
            : 0,
        // selectedMarriageAid.length,
        marriageAidController.text != ''
            ? int.parse(marriageAidController.text.trim())
            : 0,
        // selectedWidowAid.length,
        widowAidController.text != ''
            ? int.parse(widowAidController.text.trim())
            : 0,
        // selectedAidDifferentlyAbled.length,
        differentlyController.text != ''
            ? int.parse(differentlyController.text.trim())
            : 0,
        // selectedMedicalAid.length,
        medicalController.text != ''
            ? int.parse(medicalController.text.trim())
            : 0,
        // selectedHouseConstructionAid.length,
        houseController.text != '' ? int.parse(houseController.text.trim()) : 0,
        // selectedOtherAid.length,
        otherController.text != '' ? int.parse(otherController.text.trim()) : 0,
        cottageNoOfCharityWorksController.text != ''
            ? int.parse(cottageNoOfCharityWorksController.text)
            : 0,
        cottageNoOfNewVillagesController.text != ''
            ? int.parse(cottageNoOfNewVillagesController.text)
            : 0,
        cottageNoOfNewEvangelistsController.text != ''
            ? int.parse(cottageNoOfNewEvangelistsController.text)
            : 0,

        receiptsController.text != '' ? int.parse(receiptsController.text) : 0,

        paymentController.text != ''
            ? int.parse(paymentController.text.trim())
            : 0,

        remarkController.text != '' ? remarkController.text.trim() : '',
      );

      if (!httpResponse.hasError) {
        notifyListeners();
        submitAction = false;
      } else {
        Utils().cancelToast();
        submitAction = false;
        var data = httpResponse.response!.body;
        Utils().showToast(data.toString());
      }
    } else {
      Utils().cancelToast();
      submitAction = false;
      notifyListeners();
      Utils().showToast('Please_check_your_details');
    }
  }
}
