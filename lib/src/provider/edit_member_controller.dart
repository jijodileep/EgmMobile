import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../constant/constant.dart';
import '../features/edit_member.dart/edit_member_screen.dart';
import '../model/church_model.dart';
import '../model/get_family_member_model.dart';
import '../model/relation_model.dart';
import '../services/family_service.dart';
import '../utils/utils.dart';

class EditMemberController extends ChangeNotifier {
  FamilyMemberData? data;
  late String id;
  late int familyId;
  var editMemberLoader = false;

  final GlobalKey<FormState> editMemberFormKey = GlobalKey<FormState>();

  final memberNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String? imagePath;
  String? imageName;
  var cropImagePath = '';

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
  final educationController = TextEditingController();

  late var selectedDateOfMembership = DateTime.now();

  bool selectedIsBaptism = false;
  final churchNameController = TextEditingController();

  late var selectedDateOfBaptism = DateTime.now();
  final occupationController = TextEditingController();

  var submitAction = false;

  List<ChurchData> churchData = <ChurchData>[];

  List<RelationData> relationData = <RelationData>[];
  var selectedRelation = "";

  bool isDeath = false;
  bool isHead = false;

  getChurch() async {
    var httpResponse = await FamilyService().getChurch();
    if (!httpResponse.hasError) {
      var churchModel = ChurchModel.fromMap(httpResponse.response!.data);
      churchData = churchModel.data!;
      notifyListeners();
    } else {
      Utils().cancelToast();
      editMemberLoader = false;
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  getRelation() async {
    editMemberLoader = true;
    var httpResponse = await FamilyService().getRelation();
    if (!httpResponse.hasError) {
      var data = RelationModel.fromMap(httpResponse.response!.data!);
      relationData = data.data!;
      editMemberLoader = false;
      notifyListeners();
    } else {
      Utils().cancelToast();
      editMemberLoader = false;
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

  void setSelectedRelation(String value) {
    selectedRelation = value;
    notifyListeners();
  }

  onEdit() async {
    Utils.hideKeyboard();
    if (editMemberFormKey.currentState!.validate()) {
      if (selectedRelation != "") {
        submitAction = true;
        var httpResponse = await FamilyService().editMember(
          imagePath ?? '',
          imageName ?? imagePath!,
          data!.id!,
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
          int.parse(id),
          int.parse(selectedRelation),
          isDeath,
          isHead,
        );
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
        Utils().showToast('Select_Relation');
        notifyListeners();
      }
    } else {
      Utils().cancelToast();
      submitAction = false;
      Utils().showToast('Please_check_your_details');
      notifyListeners();
    }
  }
}
