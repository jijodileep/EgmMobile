import 'dart:convert';
import 'dart:io';

import '../features/edit_family/edit_family_screen.dart';
import '/src/model/relation_model.dart';
import '/src/services/family_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../constant/constant.dart';
import '../model/church_model.dart';
import '../utils/utils.dart';

class CreateMemberController extends ChangeNotifier {
  late String? familyId;
  late String id;
  var createMemberLoader = false;

  final GlobalKey<FormState> createMemberFormKey = GlobalKey<FormState>();

  String? imagePath;
  String? imageName;
  var cropImagePath = '';

  final memberNameController = TextEditingController();
  final churchNameController = TextEditingController();
  final occupationController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final educationController = TextEditingController();

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
  String selectedDOBText = "";
  DateTime? savedDOB;
  bool selectedIsBaptism = false;
  late var selectedDateOfBaptism = DateTime.now();
  String selectedDateOfBaptismText = "";
  late var selectedDateOfMembership = DateTime.now();
  String selectedDateOfMembershipText = "";

  List<ChurchData> churchData = <ChurchData>[];

  List<RelationData> relationData = <RelationData>[];
  var selectedRelation = "";
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  getChurch() async {
    var httpResponse = await FamilyService().getChurch();
    if (!httpResponse.hasError) {
      var churchModel = ChurchModel.fromMap(httpResponse.response!.data);
      churchData = churchModel.data!;
      notifyListeners();
    } else {
      Utils().cancelToast();
      createMemberLoader = false;
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  getRelation() async {
    createMemberLoader = true;
    var httpResponse = await FamilyService().getRelation();
    if (!httpResponse.hasError) {
      var data = RelationModel.fromMap(httpResponse.response!.data!);
      relationData = data.data!;
      createMemberLoader = false;
      notifyListeners();
    } else {
      Utils().cancelToast();
      createMemberLoader = false;
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
        notifyListeners();
      }
    });
  }

  convertIntoBase64(String path) async {
    var bytes = await File(path).readAsBytes();
    // ignore: await_only_futures
    return await base64Encode(bytes);
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
      savedDOB = selectedDOB;
      selectedDOBText = selectedDOB.toString();
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
    if (pickedDate != null && pickedDate != selectedDateOfMembership) {
      selectedDateOfMembership = pickedDate;
      notifyListeners();
    }
  }

  void setSelectedRelation(String value) {
    selectedRelation = value;
    notifyListeners();
  }

  onCreate() async {
    Utils.hideKeyboard();
    if (createMemberFormKey.currentState!.validate() &&
        selectedRelation != "") {
      createMemberLoader = true;
      if (selectedGender != "") {
        if (savedDOB != null) {
          var httpResponse = await FamilyService().createMember(
              imagePath!,
              memberNameController.text.trim(),
              int.parse(selectedGender),
              Utils().convertDateTimeAPI(selectedDOB.toString()),
              selectedIsBaptism,
              churchNameController.text.trim(),
              educationController.text.trim(),
              occupationController.text.trim(),
              Utils().convertDateTimeAPI(selectedDateOfBaptism.toString()),
              Utils().convertDateTimeAPI(selectedDateOfMembership.toString()),
              int.parse(selectedMarriage),
              phoneNumberController.text.trim(),
              familyId,
              id,
              int.parse(selectedRelation));
          if (!httpResponse.hasError) {
            createMemberLoader = false;
            notifyListeners();
          } else {
            Utils().cancelToast();
            createMemberLoader = false;
            var data = httpResponse.dioError.response!.data['errors'];
            Utils().showToast(data.toString(), length: Toast.LENGTH_LONG);
          }
        } else {
          Utils().cancelToast();
          createMemberLoader = false;
          Utils().showToast('SelectDOB');
        }
      } else {
        Utils().cancelToast();
        createMemberLoader = false;
        Utils().showToast('Select_Your_Gender');
      }
    } else {
      Utils().cancelToast();
      createMemberLoader = false;
      Utils().showToast('Please_check_your_details');
    }
  }
}
