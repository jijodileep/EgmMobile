import 'dart:convert';
import 'dart:io';

import '../features/edit_family/edit_family_screen.dart';
import '/src/constant/constant.dart';
import '/src/model/interest_model.dart';
import '/src/model/church_model.dart';
import '/src/model/religion_model.dart';
import '/src/model/village_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../model/caste_model.dart';
import '../services/family_service.dart';
import '../utils/utils.dart';

class CreateFamilyController extends ChangeNotifier {
  late String id;
  var createFamilyLoader = false;

  final GlobalKey<FormState> createFamilyFormKey = GlobalKey<FormState>();
  final familyController = TextEditingController();
  final familyPhoneNumber = TextEditingController();
  final postCodeController = TextEditingController();
  final educationController = TextEditingController();
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final churchNameController = TextEditingController();
  final occupationController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String? imagePath;
  String? imageName;
  var cropImagePath = '';
  bool loadVillage = false;
  List<VillageData> villageData = <VillageData>[];
  var selectedVillage = "";
  List<ReligionData> religionData = <ReligionData>[];
  var selectedReligion = "";
  var loadCast = false;
  List<CasteData> casteData = <CasteData>[];
  var selectedCaste = "";

  bool selectedChurchMember = false;
  List<ChurchData> churchData = <ChurchData>[];
  var selectedChurch = "";
  List<InterestData> interestData = <InterestData>[];
  var selectedInterest = "";

  List<Gender> getLanguages = <Gender>[
    const Gender(0, 'Male'),
    const Gender(1, 'Female'),
    const Gender(2, 'Others'),
  ];
  var selectedGender = "";

  List<Marriage> getMarriage = <Marriage>[
    const Marriage(0, 'Married'),
    const Marriage(1, 'NonMarried'),
    const Marriage(2, 'Divorced'),
    const Marriage(3, 'Separated'),
  ];
  var selectedMarriage = "";

  late var selectedDOB = DateTime.now();
  String selectDOBText = "";

  bool selectedIsBaptism = false;
  late var selectedDateOfBaptism = DateTime.now();
  String selectDateOfBaptismText = "";

  late var selectedDateOfMembership = DateTime.now();
  String selectMembershipText = "";

  var submitAction = false;

  int? stateId, districtID, talukID;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  getGeneralData() async {
    createFamilyLoader = true;
    getReligion();
    getCastes();
    getChurch();
    getInterest();
    createFamilyLoader = false;
    notifyListeners();
  }

  getReligion() async {
    var httpResponseState = await FamilyService().getReligion();
    if (!httpResponseState.hasError) {
      var religionModel =
          ReligionModel.fromMap(httpResponseState.response!.data);
      religionData = religionModel.data!;
      notifyListeners();
    } else {
      Utils().cancelToast();
      createFamilyLoader = false;
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  pickImage(ImageSource source) async {
    ImagePicker().pickImage(source: source).then((image) async {
      if (image != null) {
        imageName = null;
        final cropImageFile = await ImageCropper().cropImage(
            sourcePath: image.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
            maxWidth: 512,
            maxHeight: 512,
            uiSettings: [
              AndroidUiSettings(
                  toolbarTitle: 'Cropper',
                  toolbarColor: ColorConstant.primaryColor,
                  toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.original,
                  activeControlsWidgetColor: ColorConstant.primaryColor,
                  lockAspectRatio: false),
            ],
            compressFormat: ImageCompressFormat.jpg);
        cropImagePath = cropImageFile!.path;
        convertIntoBase64(cropImagePath).then((value) async {
          imagePath = value.toString();
          imageName = image.name;
          notifyListeners();
        });
      } else {
        Utils().cancelToast();
        imagePath = null;
        imageName = null;
        Utils().showToast('something_error');
      }
    });
  }

  convertIntoBase64(String path) async {
    var bytes = await File(path).readAsBytes();
    // ignore: await_only_futures
    return await base64Encode(bytes);
  }

  fetchVillage(String talukId) async {
    var httpResponse = await FamilyService().getVillage(talukId);
    if (!httpResponse.hasError) {
      var villageModel = VillageModel.fromMap(httpResponse.response!.data);
      villageData = villageModel.data!;
      notifyListeners();
    } else {
      Utils().cancelToast();
      createFamilyLoader = false;
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  void setSelectedVillage(String value) {
    selectedVillage = value;
    notifyListeners();
  }

  void setSelectedReligion(String value) {
    selectedReligion = value;
    notifyListeners();
  }

  getCastes() async {
    var httpResponse = await FamilyService().getCastes();
    if (!httpResponse.hasError) {
      var casteModel = CasteModel.fromMap(httpResponse.response!.data);
      casteData = casteModel.data!;
      notifyListeners();
    } else {
      Utils().cancelToast();
      createFamilyLoader = false;
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  void setSelectedCaste(String value) {
    selectedCaste = value;
    notifyListeners();
  }

  getChurch() async {
    var httpResponse = await FamilyService().getChurch();
    if (!httpResponse.hasError) {
      var churchModel = ChurchModel.fromMap(httpResponse.response!.data);
      churchData = churchModel.data!;
      notifyListeners();
    } else {
      Utils().cancelToast();
      createFamilyLoader = false;
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  void setSelectedChurch(String value) {
    selectedChurch = value;
    notifyListeners();
  }

  getInterest() async {
    var httpResponse = await FamilyService().getInterestStatus();
    if (!httpResponse.hasError) {
      var interestModel = InterestModel.fromMap(httpResponse.response!.data);
      interestData = interestModel.data!;
      notifyListeners();
    } else {
      Utils().cancelToast();
      createFamilyLoader = false;
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  void setSelectedInterest(String value) {
    selectedInterest = value;
    notifyListeners();
  }

  void setSelectedGender(String value) {
    selectedGender = value;
    notifyListeners();
  }

  void setSelectedMar(String value) {
    selectedMarriage = value;
    notifyListeners();
  }

  selectDOB(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDOB,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      selectedDOB = pickedDate;
      selectDOBText = selectedDOB.toString();
      notifyListeners();
    }
  }

  selectDOBaptism(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateOfBaptism,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      selectedDateOfBaptism = pickedDate;
      notifyListeners();
    }
  }

  selectDateOfMembership(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateOfMembership,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      selectedDateOfMembership = pickedDate;
      notifyListeners();
    }
  }

  onCreate() async {
    // Create function for the form.
    Utils.hideKeyboard();
    if (createFamilyFormKey.currentState!.validate()) {
      submitAction = true;
//
      if (familyController.text.isNotEmpty || nameController.text.isNotEmpty) {
        if (selectedMarriage != '') {
          if (familyPhoneNumber.text.isNotEmpty) {
            if (selectedVillage != "") {
              if (selectedReligion != "") {
                if (selectedCaste != "") {
                  if (selectedGender != "") {
                    if (selectedInterest != "") {
                      var httpResponse = await FamilyService().createFamily(
                          familyController.text.trim(),
                          familyPhoneNumber.text.trim(),
                          imagePath ?? '',
                          stateId!,
                          districtID!,
                          talukID!,
                          int.parse(selectedReligion),
                          int.parse(selectedCaste),
                          int.parse(selectedVillage),
                          selectedChurchMember,
                          selectedChurch == "" ? null : selectedChurch,
                          postCodeController.text.trim(),
                          addressController.text,
                          int.parse(selectedInterest),
                          nameController.text.trim(),
                          educationController.text.trim(),
                          int.parse(selectedGender),
                          Utils().convertDateTimeAPI(selectedDOB.toString()),
                          selectedIsBaptism,
                          churchNameController.text.trim(),
                          occupationController.text.trim(),
                          Utils().convertDateTimeAPI(
                              selectedDateOfBaptism.toString()),
                          Utils().convertDateTimeAPI(
                              selectedDateOfMembership.toString()),
                          int.parse(selectedMarriage),
                          familyPhoneNumber.text.trim(),
                          id);
                      if (!httpResponse.hasError) {
                        submitAction = false;
                        notifyListeners();
                      } else {
                        Utils().cancelToast();
                        submitAction = false;
                        var data =
                            httpResponse.dioError.response!.data['errors'];
                        Utils().showToast(data.toString(),
                            length: Toast.LENGTH_LONG);
                      }
                    } else {
                      Utils().cancelToast();
                      submitAction = false;
                      Utils().showToast('Select_Your_Interest');
                    }
                  } else {
                    Utils().cancelToast();
                    submitAction = false;
                    Utils().showToast('Select_Your_Gender');
                  }
                } else {
                  Utils().cancelToast();
                  submitAction = false;
                  Utils().showToast('Select_Your_Caste');
                }
              } else {
                Utils().cancelToast();
                submitAction = false;
                Utils().showToast('Select_Your_Religion');
              }
            } else {
              Utils().cancelToast();
              submitAction = false;
              Utils().showToast('Select_Your_Village');
            }
          } else {
            Utils().cancelToast();
            submitAction = false;
            Utils().showToast('Enter_Family_Contact_Number');
          }
        } else {
          Utils().cancelToast();
          submitAction = false;
          Utils().showToast('selectMaritalStatus');
        }
      } else {
        Utils().cancelToast();
        submitAction = false;
        Utils().showToast('Enter_Family_Name');
      }
    } else {
      Utils().cancelToast();
      submitAction = false;
      Utils().showToast('Please_check_your_details');
    }
  }
}
