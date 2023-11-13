import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/edit_member_controller.dart';
import '../../utils/utils.dart';
import '../../widget/camera_photo_widget.dart';

class EditMemberScreen extends StatelessWidget {
  const EditMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('editMember'),
      body: const SafeArea(bottom: false, child: EditMemberView()),
    );
  }
}

class EditMemberView extends StatefulWidget {
  const EditMemberView({super.key});

  @override
  State<EditMemberView> createState() => _EditMemberViewState();
}

class _EditMemberViewState extends State<EditMemberView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EditMemberController>(context);
    return Form(
      key: controller.editMemberFormKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
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

            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: InputDecorator(
                decoration: drop(
                  'Gender',
                ),
                child: DropdownButton(
                  isExpanded: true,
                  isDense: true,
                  underline: const SizedBox(),
                  hint: Text('Gender', style: FontConstant.inter),
                  value: controller.selectedGender.isNotEmpty
                      ? controller.selectedGender
                      : null,
                  onChanged: (newValue) {
                    setState(() {
                      controller.setSelectedGender(newValue!);
                    });
                  },
                  items: controller.getLanguages.map((Gender gender) {
                    return DropdownMenuItem<String>(
                      value: gender.id.toString(),
                      child: Text(gender.name),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                controller.selectDOB(context);
              },
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: uploadPhoto(),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                      child: Text(
                          'selectDOB${Utils().convertDateTimeDisplay(controller.selectedDOB.toString())}',
                          style: FontConstant.inter))),
            ),
            const SizedBox(height: 10),

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
            InputDecorator(
              decoration: drop(
                'Is_Married',
              ),
              child: DropdownButton(
                isExpanded: true,
                isDense: true,
                underline: const SizedBox(),
                hint: Text('Is_Married', style: FontConstant.inter),
                value: controller.selectedMarriage.isNotEmpty
                    ? controller.selectedMarriage
                    : null,
                onChanged: (newValue) {
                  setState(() {
                    controller.setSelectedMar(newValue!);
                  });
                },
                items: controller.getMarriage.map((Marriage gender) {
                  return DropdownMenuItem<String>(
                    value: gender.id.toString(),
                    child: Text(gender.name),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),

            controller.imageName == null
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
                          'Selected_Image${controller.imageName}',
                          textAlign: TextAlign.center,
                          style: FontConstant.inter,
                        )),
                  ),
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

            // SizedBox(height: 10),

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

            // SizedBox(height: 10),
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
                            child: Utils().convertDateTimeDisplay(controller
                                        .selectedDateOfBaptism
                                        .toString()) ==
                                    Utils().convertDateTimeDisplay(
                                        DateTime.now().toString())
                                ? Text('Date_Of_Baptism',
                                    style: FontConstant.inter)
                                : Text(
                                    'Selected_Date_Of_Baptism${Utils().convertDateTimeDisplay(controller.selectedDateOfBaptism.toString())}',
                                    style: FontConstant.inter))),
                  )
                : Container(),

            GestureDetector(
              onTap: () {
                controller.selectDateOfMembership(context);
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: uploadPhoto(),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Center(
                      child: Text(
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
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('isDead', style: FontConstant.inter),
              checkColor: Colors.white,
              activeColor: ColorConstant.primaryColor,
              controlAffinity: ListTileControlAffinity.leading,
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: controller.isDeath == true,
              onChanged: (val) {
                val ?? true
                    ? controller.isDeath = true
                    : controller.isDeath = false;
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('isHeadOfFamily', style: FontConstant.inter),
              checkColor: Colors.white,
              activeColor: ColorConstant.primaryColor,
              controlAffinity: ListTileControlAffinity.leading,
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: controller.isHead == true,
              onChanged: (val) {
                setState(() {
                  val ?? true
                      ? controller.isHead = true
                      : controller.isHead = false;
                });
              },
            ),

            controller.submitAction
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 33),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: ColorConstant.primaryColor,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      controller.onEdit();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 33),
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          borderRadius: BorderRadius.circular(06)),
                      alignment: Alignment.center,
                      child: Text(
                        'update',
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

/// The above code defines two classes, Gender and Marriage, with properties for id and name.
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
