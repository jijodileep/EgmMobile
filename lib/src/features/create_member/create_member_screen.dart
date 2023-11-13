import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/create_member_controller.dart';
import '../../utils/utils.dart';
import '../../widget/camera_photo_widget.dart';

class CreateMemberScreen extends StatelessWidget {
  const CreateMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('Create_Member'),
      body: const SafeArea(bottom: false, child: CreateMemberView()),
    );
  }
}

class CreateMemberView extends StatefulWidget {
  const CreateMemberView({super.key});

  @override
  State<CreateMemberView> createState() => _CreateMemberViewState();
}

class _CreateMemberViewState extends State<CreateMemberView> {
  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<CreateMemberController>(context, listen: false);
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Form(
      key: controller.createMemberFormKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(height: height * 0.03),
            TextFormField(
              controller: controller.memberNameController,
              decoration: memberName(),
              validator: Utils.validateEmpty,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.phoneNumberController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (val) {
                if (val.length == 10) {
                  Utils.hideKeyboard();
                }
              },
              decoration: phoneNumber(),
              validator: Utils.validatePhone,
            ),
            const SizedBox(height: 10),

            Consumer<CreateMemberController>(
              builder: (context, ref, child) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: InputDecorator(
                    decoration: drop(
                      'Gender',
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      isDense: true,
                      underline: const SizedBox(),
                      hint: Text('selectGender', style: FontConstant.inter),
                      value: ref.selectedGender.isNotEmpty
                          ? ref.selectedGender
                          : null,
                      onChanged: (newValue) {
                        setState(() {
                          ref.setSelectedGender(newValue!.toString());
                        });
                      },
                      items: ref.getLanguages
                          .map(
                            (map) => DropdownMenuItem(
                              value: map.id,
                              child: Text(map.name),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
            ),

            GestureDetector(
              onTap: () {
                controller.selectDOB(context);
              },
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: uploadPhoto(),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                      child: controller.selectedDOBText == ""
                          ? Text('Date_Of_Birth', style: FontConstant.inter)
                          : Text(
                              'selectDOB${Utils().convertDateTimeDisplay(controller.selectedDOB.toString())}',
                              style: FontConstant.inter))),
            ),

            TextFormField(
              controller: controller.educationController,
              decoration: textField('Educational_Qualification'),
              validator: Utils.validateEmpty,
            ),
            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: controller.occupationController,
                decoration: occupation(),
              ),
            ),

            // Married

            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: InputDecorator(
                decoration: drop(
                  'Is_Married',
                ),
                child: DropdownButton(
                  isExpanded: true,
                  isDense: true,
                  underline: const SizedBox(),
                  hint: Text('selectMaritalStatus', style: FontConstant.inter),
                  value: controller.selectedMarriage.isNotEmpty
                      ? controller.selectedMarriage
                      : null,
                  onChanged: (newValue) {
                    setState(() {
                      controller.setSelectedMar(newValue!.toString());
                    });
                  },
                  items: controller.getMarriage
                      .map(
                        (map) => DropdownMenuItem(
                          value: map.id,
                          child: Text(map.name),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            // image picker section.

            Consumer<CreateMemberController>(
              builder: (context, ref, child) {
                return ref.imageName == null
                    ? InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => CameraPhotoWidget(gallery: () {
                                    controller.pickImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  }, camera: () {
                                    controller.pickImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(08),
                          decoration: uploadPhoto(),
                          child: Center(
                            child: Text(
                              'Upload_Photo',
                              style: FontConstant.inter,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => CameraPhotoWidget(gallery: () {
                                    controller.pickImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  }, camera: () {
                                    controller.pickImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  }));
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            alignment: Alignment.center,
                            decoration: uploadPhoto(),
                            child: Text(
                              'Selected_Image${ref.imageName}',
                              textAlign: TextAlign.center,
                              style: FontConstant.inter,
                            )),
                      );
              },
            ),

            const SizedBox(height: 10),

            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Is_Baptism', style: FontConstant.inter),
              checkColor: Colors.white,
              activeColor: ColorConstant.primaryColor,
              controlAffinity: ListTileControlAffinity.leading,
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: controller.selectedIsBaptism == true,
              onChanged: (val) {
                setState(() {
                  val ?? true
                      ? controller.selectedIsBaptism = true
                      : controller.selectedIsBaptism = false;
                  controller.churchNameController.text = '';
                });
              },
            ),

            controller.selectedIsBaptism
                ? Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: controller.churchNameController,
                        decoration: churchName(),
                      ),
                      suggestionsCallback: (pattern) {
                        return controller.churchData;
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion.name!),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                      onSuggestionSelected: (suggestion) {
                        setState(() {
                          controller.churchNameController.text =
                              suggestion.name!;
                        });
                      },
                      validator: Utils.validateEmpty,
                    ),
                  )
                : Container(),

            controller.selectedIsBaptism
                ? GestureDetector(
                    onTap: () {
                      controller.selectDOBaptism(context);
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: uploadPhoto(),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Center(
                            child: controller.selectedDateOfBaptismText == ""
                                ? Text('Date_Of_Baptism',
                                    style: FontConstant.inter)
                                : Text(
                                    'Selected_Date_Of_Baptism${Utils().convertDateTimeDisplay(controller.selectedDateOfBaptism.toString())}',
                                    style: FontConstant.inter))),
                  )
                : Container(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                controller.selectDateOfMembership(context);
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: uploadPhoto(),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Center(
                      child: controller.selectedDateOfMembershipText == ""
                          ? Text('Date_Of_Membership',
                              style: FontConstant.inter)
                          : Text(
                              '${'Date_Of_Membership'} : ${Utils().convertDateTimeDisplay(controller.selectedDateOfMembership.toString())}',
                              style: FontConstant.inter))),
            ),
            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: InputDecorator(
                decoration: drop(
                  'Select_Relation',
                ),
                child: DropdownButton(
                    isExpanded: true,
                    isDense: true,
                    underline: const SizedBox(),
                    hint: Text('Select_Relation', style: FontConstant.inter),
                    value: controller.selectedRelation.isNotEmpty
                        ? controller.selectedRelation.toString()
                        : null,
                    items: controller.relationData.map((element) {
                      return DropdownMenuItem<String>(
                        value: element.id.toString(),
                        child: Text(
                          element.name.toString(),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        controller.setSelectedRelation(newValue.toString());
                      });
                    }),
              ),
            ),

            controller.createMemberLoader
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 33),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: ColorConstant.primaryColor,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      controller.onCreate();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 33),
                      width: width,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          borderRadius: BorderRadius.circular(06)),
                      alignment: Alignment.center,
                      child: Text(
                        'Create',
                        style: FontConstant.inter.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorConstant.whiteColor),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class Gender {
  final int id;
  final String name;

  const Gender(this.id, this.name);
}

class Marriage {
  final int id;
  final String name;

  const Marriage(this.id, this.name);
}
