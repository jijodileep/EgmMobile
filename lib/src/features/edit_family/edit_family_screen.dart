import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/edit_family_controller.dart';
import '../../utils/utils.dart';
import '../../widget/camera_photo_widget.dart';

class EditFamilyScreen extends StatelessWidget {
  const EditFamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('editFamily'),
      body: const SafeArea(bottom: false, child: EditFamilyView()),
    );
  }
}

class EditFamilyView extends StatefulWidget {
  const EditFamilyView({super.key});

  @override
  State<EditFamilyView> createState() => _EditFamilyViewState();
}

class _EditFamilyViewState extends State<EditFamilyView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EditFamilyController>(
      builder: (context, controller, child) {
        var width = MediaQuery.sizeOf(context).width;
        var height = MediaQuery.sizeOf(context).height;
        return controller.editFamilyLoader
            ? const Center(
                child: CircularProgressIndicator(
                    color: ColorConstant.primaryColor),
              )
            : Form(
                key: controller.editFamilyFormKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      SizedBox(height: height * 0.03),

                      /// The above code is creating a Container widget that contains a TextFormField
                      /// widget. The TextFormField widget is used to capture user input for a name. It
                      /// is connected to a TextEditingController named "nameController" which allows you
                      /// to access and manipulate the entered value. The TextFormField widget is also
                      /// decorated with a custom decoration called "member()" and has a validator
                      /// function called "Utils.validateEmpty" which is used to validate the input. The
                      /// Container widget has a margin of 10 pixels at the bottom.
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: controller.nameController,
                          decoration: member(),
                          validator: Utils.validateEmpty,
                        ),
                      ),
                      TextFormField(
                        controller: controller.familyController,
                        decoration: familyName(),
                        validator: Utils.validateEmpty,
                      ),
                      const SizedBox(height: 10),

                      TextFormField(
                        controller: controller.familyPhoneNumber,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (val) {
                          if (val.length == 10) {
                            Utils.hideKeyboard();
                          }
                        },
                        decoration: familyPhoneNumber(),
                        validator: Utils.validatePhone,
                      ),
                      const SizedBox(height: 10),

// Gender
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

// Date of birth
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

// Select caste
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: InputDecorator(
                          decoration: drop(
                            'Select_Religion',
                          ),
                          child: DropdownButton(
                              isExpanded: true,
                              isDense: true,
                              underline: const SizedBox(),
                              hint: Text('Select_Religion',
                                  style: FontConstant.inter),
                              value: controller.selectedReligion.isNotEmpty
                                  ? controller.selectedReligion.toString()
                                  : null,
                              items: controller.religionData.map((element) {
                                return DropdownMenuItem<String>(
                                  value: element.id.toString(),
                                  child: Text(
                                    element.name.toString(),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                controller
                                    .setSelectedReligion(newValue.toString());
                              }),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: InputDecorator(
                          decoration: drop(
                            'Select_Caste',
                          ),
                          child: DropdownButton(
                              isExpanded: true,
                              isDense: true,
                              underline: const SizedBox(),
                              hint: Text('Select_Caste',
                                  style: FontConstant.inter),
                              value: controller.selectedCaste.isNotEmpty
                                  ? controller.selectedCaste.toString()
                                  : null,
                              items: controller.casteData.map((element) {
                                return DropdownMenuItem<String>(
                                  value: element.id.toString(),
                                  child: Text(
                                    element.name.toString(),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  controller
                                      .setSelectedCaste(newValue.toString());
                                });
                              }),
                        ),
                      ),
// Education
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: controller.educationController,
                          keyboardType: TextInputType.text,
                          decoration: textField('Educational_Qualification'),
                          validator: Utils.validateEmpty,
                        ),
                      ),

// Occupation
                      TextFormField(
                        controller: controller.occupationController,
                        decoration: occupation(),
                      ),
                      const SizedBox(height: 10),

// is marriage

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
                            hint: Text('Is_Married', style: FontConstant.inter),
                            value: controller.selectedMarriage.isNotEmpty
                                ? controller.selectedMarriage
                                : null,
                            onChanged: (newValue) {
                              setState(() {
                                controller.setSelectedMar(newValue!);
                              });
                            },
                            items:
                                controller.getMarriage.map((Marriage gender) {
                              return DropdownMenuItem<String>(
                                value: gender.id.toString(),
                                child: Text(gender.name),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      // image picker section.

                      controller.imageName == null
                          ? InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (_) =>
                                        CameraPhotoWidget(gallery: () {
                                          controller
                                              .pickImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        }, camera: () {
                                          controller
                                              .pickImage(ImageSource.camera);
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
                                    builder: (_) =>
                                        CameraPhotoWidget(gallery: () {
                                          controller
                                              .pickImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        }, camera: () {
                                          controller
                                              .pickImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        }));
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.center,
                                  decoration: uploadPhoto(),
                                  child: Text(
                                    'Selected_Image${controller.imageName}',
                                    textAlign: TextAlign.center,
                                    style: FontConstant.inter,
                                  )),
                            ),
                      const SizedBox(height: 10),

                      controller.loadVillage
                          ? Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: InputDecorator(
                                decoration: drop(
                                  'Select_Village',
                                ),
                                child: DropdownButton(
                                    isExpanded: true,
                                    isDense: true,
                                    underline: const SizedBox(),
                                    hint: Text('Select_Village',
                                        style: FontConstant.inter),
                                    value: controller.selectedVillage.isNotEmpty
                                        ? controller.selectedVillage.toString()
                                        : null,
                                    items:
                                        controller.villageData.map((element) {
                                      return DropdownMenuItem<String>(
                                        value: element.id.toString(),
                                        child: Text(
                                          element.name.toString(),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        controller.setSelectedVillage(
                                            newValue.toString());
                                      });
                                    }),
                              ),
                            )
                          : Container(),

                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          controller: controller.addressController,
                          maxLines: 5,
                          minLines: 5,
                          decoration: address(),
                          validator: Utils.validateEmpty,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: controller.postCodeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (val) {
                            if (val.length == 6) {
                              Utils.hideKeyboard();
                            }
                          },
                          decoration: pinCode(),
                          validator: Utils.validateEmpty,
                        ),
                      ),

// is baptism
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
                                transitionBuilder:
                                    (context, suggestionsBox, controller) {
                                  return suggestionsBox;
                                },
                                onSuggestionSelected: (suggestion) {
                                  setState(() {
                                    controller.churchNameController.text =
                                        suggestion.name!;
                                  });
                                },
                              ),
                            )
                          : Container(),
                      controller.selectedIsBaptism
                          ? GestureDetector(
                              onTap: () {
                                controller.selectDOBaptism(context);
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: uploadPhoto(),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Center(
                                      child: Text(
                                          'Selected_Date_Of_Baptism${Utils().convertDateTimeDisplay(controller.selectedDateOfBaptism.toString())}',
                                          style: FontConstant.inter))),
                            )
                          : Container(),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title:
                            Text('Is_Church_Member', style: FontConstant.inter),
                        checkColor: Colors.white,
                        activeColor: ColorConstant.primaryColor,
                        controlAffinity: ListTileControlAffinity.leading,
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        value: controller.selectedChurchMember == true,
                        onChanged: (val) {
                          setState(() {
                            val ?? true
                                ? controller.selectedChurchMember = true
                                : controller.selectedChurchMember = false;
                            controller.selectedChurch = '';
                          });
                        },
                      ),

                      controller.selectedChurchMember
                          ? Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: InputDecorator(
                                decoration: drop(
                                  'Select_Church',
                                ),
                                child: DropdownButton(
                                    isExpanded: true,
                                    isDense: true,
                                    underline: const SizedBox(),
                                    hint: Text('Select_Church',
                                        style: FontConstant.inter),
                                    value: controller.selectedChurch.isNotEmpty
                                        ? controller.selectedChurch.toString()
                                        : null,
                                    items: controller.churchData.map((element) {
                                      return DropdownMenuItem<String>(
                                        value: element.id.toString(),
                                        child: Text(
                                          element.name.toString(),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        controller.setSelectedChurch(
                                            newValue.toString());
                                      });
                                    }),
                              ),
                            )
                          : Container(),

                      InputDecorator(
                        decoration: drop(
                          'Select_Interest',
                        ),
                        child: DropdownButton(
                            isExpanded: true,
                            isDense: true,
                            underline: const SizedBox(),
                            hint: Text('Select_Interest',
                                style: FontConstant.inter),
                            value: controller.selectedInterest.isNotEmpty
                                ? controller.selectedInterest.toString()
                                : null,
                            items: controller.interestData.map((element) {
                              return DropdownMenuItem<String>(
                                value: element.id.toString(),
                                child: Text(
                                  element.name.toString(),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                controller
                                    .setSelectedInterest(newValue.toString());
                              });
                            }),
                      ),

                      const SizedBox(height: 10.00),

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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 33),
                                width: width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                ));
      },
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
