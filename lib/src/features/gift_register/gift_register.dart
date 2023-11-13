import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../model/all_member_model.dart';
import '../../provider/gift_register_controller.dart';
import '../../utils/utils.dart';

class GiftRegister extends StatelessWidget {
  const GiftRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('ChristmasGift'),
      ),
      body: const SafeArea(child: AddGiftView()),
    );
  }
}

class AddGiftView extends StatefulWidget {
  const AddGiftView({super.key});

  @override
  State<AddGiftView> createState() => _AddGiftViewState();
}

class _AddGiftViewState extends State<AddGiftView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GiftRegisterController>(
      builder: (context, ref, child) {
        return ref.loader
            ? const Center(
                child: CircularProgressIndicator(
                    color: ColorConstant.primaryColor))
            : ListView(
                children: [
                  Consumer<GiftRegisterController>(
                    builder: (context, controller, child) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectDOB(context);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 10,
                                left: 20.00,
                                right: 20.00,
                                top: 20.00),
                            decoration: uploadPhoto(),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                                child: Text(
                                    '${'Date'}: ${Utils().convertDateTimeDisplay(controller.selectedDOB.toString())}',
                                    style: FontConstant.inter))),
                      );
                    },
                  ),

                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 10, left: 20.00, right: 20.00),
                    child: InputDecorator(
                      decoration: drop('SelectType'),
                      child: DropdownButton(
                          underline: const SizedBox(),
                          isExpanded: true,
                          isDense: true,
                          hint: Text('SelectType', style: FontConstant.inter),
                          value: ref.selectedGiftData.isNotEmpty
                              ? ref.selectedGiftData.toString()
                              : null,
                          items: ref.giftType.map((element) {
                            return DropdownMenuItem<String>(
                              value: element.id.toString(),
                              child: Text(
                                element.name.toString(),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              ref.setSelectedGift(newValue.toString());
                            });
                          }),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //  ///
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.00),
                    child: MultiSelectDialogField(
                      items: ref.fastingMembersData
                          .map((element) => MultiSelectItem<MemberData>(element,
                              '${element.name!} - ${element.phoneNumber}'))
                          .toList(),
                      title: Text("members", style: FontConstant.inter),
                      selectedColor: ColorConstant.primaryColor,
                      decoration: uploadPhoto(),
                      autovalidateMode: AutovalidateMode.always,
                      buttonText:
                          Text("SelectMembers", style: FontConstant.inter),
                      onConfirm: (results) {
                        /// The code is updating the selected members for the gift registration.
                        List<MemberData> selectMembers = [];
                        selectMembers = results;
                        ref.selectedGiftKitId = [];
                        ref.selectedGiftKitName = [];
                        for (int i = 0; i < selectMembers.length; i++) {
                          setState(() {
                            ref.selectedGiftKitId.add(selectMembers[i].id!);
                            ref.selectedGiftKitName.add(
                                '${selectMembers[i].name!} - ${selectMembers[i].phoneNumber!}');
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ref.btnLoader
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: ColorConstant.primaryColor,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                ref.onValidate();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 30.00),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                    color: ColorConstant.primaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                                alignment: Alignment.center,
                                child: Text(
                                  'Register',
                                  style: FontConstant.inter.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.whiteColor),
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              );
      },
    );
  }
}
