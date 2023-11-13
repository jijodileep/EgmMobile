import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../constant/constant.dart';
import '../features/edit_family/edit_family_screen.dart';
import '../model/interest_model.dart';
import '../model/caste_model.dart';
import '../model/church_model.dart';
import '../model/get_family_member_model.dart';
import '../model/religion_model.dart';
import '../model/village_model.dart';
import '../services/family_service.dart';
import '../utils/utils.dart';

class EditFamilyController extends ChangeNotifier {
  late String id;

  var editFamilyLoader = false;

  FamilyMemberData? data;

  List<ReligionData> religionData = <ReligionData>[];
  List<ChurchData> churchData = <ChurchData>[];
  List<InterestData> interestData = <InterestData>[];

  final GlobalKey<FormState> editFamilyFormKey = GlobalKey<FormState>();
  var familyController = TextEditingController();
  var familyPhoneNumber = TextEditingController();
  var educationController = TextEditingController();

  String? imagePath;
  String? imageName;
  var cropImagePath = '';

  var loadVillage = true;
  List<VillageData> villageData = <VillageData>[];
  var selectedVillage = "";
  var selectedReligion = "";
  var loadCast = false;
  List<CasteData> casteData = <CasteData>[];
  var selectedCaste = "";
  bool selectedChurchMember = false;
  var selectedChurch = "";
  var postCodeController = TextEditingController();
  var addressController = TextEditingController();
  var selectedInterest = "";
  var nameController = TextEditingController();
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
  bool selectedIsBaptism = false;
  var churchNameController = TextEditingController();
  late var selectedDateOfBaptism = DateTime.now();
  var occupationController = TextEditingController();
  late var selectedDateOfMembership = DateTime.now();

  var phoneNumberController = TextEditingController();

  var submitAction = false;

  int? familyId, classId;
  int? stateId, districtId, talukId;

  getGeneralData() async {
    editFamilyLoader = true;
    fetchVillage(talukId.toString());
    getReligion();
    getCastes();
    getChurch();
    getInterest();
    editFamilyLoader = false;
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
      editFamilyLoader = true;
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  getChurch() async {
    var httpResponse = await FamilyService().getChurch();
    if (!httpResponse.hasError) {
      var churchModel = ChurchModel.fromMap(httpResponse.response!.data);
      churchData = churchModel.data!;
      notifyListeners();
    } else {
      Utils().cancelToast();
      editFamilyLoader = false;
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  getInterest() async {
    var httpResponse = await FamilyService().getInterestStatus();
    if (!httpResponse.hasError) {
      var interestModel = InterestModel.fromMap(httpResponse.response!.data);
      interestData = interestModel.data!;
      notifyListeners();
    } else {
      Utils().cancelToast();
      editFamilyLoader = false;
      Utils().showToast('something_error');
    }
  }

  pickImage(ImageSource source) async {
    ImagePicker().pickImage(source: source).then((image) async {
      if (image != null) {
        imageName = null;
        var cropImageFile = await ImageCropper().cropImage(
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
        notifyListeners();
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
      editFamilyLoader = false;
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
    loadCast = true;
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
      editFamilyLoader = false;
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  void setSelectedCaste(String value) {
    selectedCaste = value;
    notifyListeners();
  }

  void setSelectedChurch(String value) {
    selectedChurch = value;
    notifyListeners();
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
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDOB) {
      selectedDOB = pickedDate;
      notifyListeners();
    }
  }

  selectDOBaptism(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateOfBaptism,
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDateOfBaptism) {
      selectedDateOfBaptism = pickedDate;

      notifyListeners();
    }
  }

  selectDateOfMembership(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateOfMembership,
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDateOfMembership) {
      selectedDateOfMembership = pickedDate;
      notifyListeners();
    }
  }

  onEdit() async {
    Utils.hideKeyboard();
    if (editFamilyFormKey.currentState!.validate()) {
      submitAction = true;

      if (familyController.text.isNotEmpty || nameController.text.isNotEmpty) {
        if (familyPhoneNumber.text.isNotEmpty) {
          if (selectedVillage != "") {
            if (selectedReligion != "") {
              if (selectedCaste != "") {
                if (selectedGender != "") {
                  if (selectedInterest != "") {
                    var httpResponse = await FamilyService().editFamily(
                        familyController.text.trim(),
                        familyPhoneNumber.text.trim(),
                        imagePath ?? '',
                        imageName ?? imagePath!,
                        stateId!,
                        districtId!,
                        talukId!,
                        int.parse(selectedReligion),
                        int.parse(selectedCaste),
                        int.parse(selectedVillage),
                        selectedChurchMember,
                        selectedChurch == "" ? null : selectedChurch,
                        postCodeController.text.trim(),
                        addressController.text.trim(),
                        int.parse(selectedInterest),
                        nameController.text.trim(),
                        educationController.text.trim(),
                        int.parse(selectedGender),
                        Utils().convertDateTimeDisplay(selectedDOB.toString()),
                        selectedIsBaptism,
                        churchNameController.text.trim(),
                        occupationController.text.trim(),
                        Utils().convertDateTimeDisplay(
                            selectedDateOfBaptism.toString()),
                        Utils().convertDateTimeDisplay(
                            selectedDateOfMembership.toString()),
                        int.parse(selectedMarriage),
                        familyPhoneNumber.text.trim(),
                        id,
                        familyId,
                        classId);
                    if (!httpResponse.hasError) {
                      submitAction = false;
                      notifyListeners();
                    } else {
                      Utils().cancelToast();
                      submitAction = false;
                      var data = httpResponse.dioError.response!.data['errors'];
                      Utils().showToast(data.toString());
                      notifyListeners();
                    }
                  } else {
                    Utils().cancelToast();
                    submitAction = false;
                    Utils().showToast('Select_Your_Interest');
                    notifyListeners();
                  }
                } else {
                  Utils().cancelToast();
                  submitAction = false;
                  Utils().showToast('Select_Your_Gender');
                  notifyListeners();
                }
              } else {
                Utils().cancelToast();
                submitAction = false;
                Utils().showToast('Select_Your_Caste');
                notifyListeners();
              }
            } else {
              Utils().cancelToast();
              submitAction = false;
              Utils().showToast('Select_Your_Religion');
              notifyListeners();
            }
          } else {
            Utils().cancelToast();
            submitAction = false;
            Utils().showToast('Select_Your_Village');
            notifyListeners();
          }
        } else {
          Utils().cancelToast();
          submitAction = false;
          Utils().showToast('Upload_Your_Photo');
          notifyListeners();
        }
      } else {
        Utils().cancelToast();
        submitAction = false;
        Utils().showToast('Enter_Family_Contact_Number');
        notifyListeners();
      }
    } else {
      Utils().cancelToast();
      submitAction = false;
      Utils().showToast('Enter_Family_Name');
      notifyListeners();
    }
  }
}
