import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../model/all_member_model.dart';
import '../../provider/edit_gift_register_controller.dart';
import '../../utils/utils.dart';

class EditGiftRegister extends StatelessWidget {
  const EditGiftRegister({super.key});

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
    final controller = Provider.of<EditGiftRegisterController>(context);
    return ListView(
      children: [
        /// The `GestureDetector` widget is used to detect gestures such as taps on the screen. In this
        /// code snippet, it is used to detect when the user taps on the container. When the container is
        /// tapped, the `onTap` callback is triggered.
        GestureDetector(
          onTap: () {
            // controller.selectDOB();
          },
          child: Container(
              margin: const EdgeInsets.only(
                  bottom: 10, left: 20.00, right: 20.00, top: 20.00),
              decoration: uploadPhoto(),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                  child: Text(
                      '${'Date'}: ${Utils().convertDateTimeDisplay(controller.selectedDOB.toString())}',
                      style: FontConstant.inter))),
        ),
        const SizedBox(height: 10),

        /// This code snippet is creating a dropdown button widget with a list of items.
        Container(
          margin: const EdgeInsets.only(bottom: 10, left: 20.00, right: 20.00),
          child: InputDecorator(
            decoration: drop('SelectType'),
            child: DropdownButton(
                underline: const SizedBox(),
                isExpanded: true,
                isDense: true,
                hint: Text('SelectType', style: FontConstant.inter),
                value: controller.selectedGiftData.isNotEmpty
                    ? controller.selectedGiftData.toString()
                    : null,
                items: controller.giftType.map((element) {
                  return DropdownMenuItem<String>(
                    value: element.id.toString(),
                    child: Text(
                      element.name.toString(),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    controller.setSelectedGift(newValue.toString());
                  });
                }),
          ),
        ),
        const SizedBox(height: 10),

        //  ///
        /// The code snippet is creating a `Container` widget that contains a `MultiSelectDialogField`.
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.00),
          child: MultiSelectDialogField(
            items: controller.fastingMembersData
                .map((element) => MultiSelectItem<MemberData>(
                    element, '${element.name!} - ${element.phoneNumber}'))
                .toList(),
            title: Text("members", style: FontConstant.inter),
            selectedColor: ColorConstant.primaryColor,
            decoration: uploadPhoto(),
            autovalidateMode: AutovalidateMode.always,
            buttonText: Text("SelectMembers", style: FontConstant.inter),
            initialValue: controller.selectedFastingMembersData,
            onConfirm: (results) {
              controller.selectedFastingMembersData = results;

              controller.selectedGiftKitId = [];
              controller.selectedGiftKitName = [];

              /// The code snippet is iterating over the `selectedFastingMembersData` list and
              /// extracting the `id` and `name` properties of each element. It then adds the `id` to
              /// the `selectedGiftKitId` list and adds the formatted string of `name` and `phoneNumber`
              /// to the `selectedGiftKitName` list. This is done to store the selected members' data
              /// for further processing or display.
              for (int i = 0;
                  i < controller.selectedFastingMembersData.length;
                  i++) {
                controller.selectedGiftKitId
                    .add(controller.selectedFastingMembersData[i].id!);
                controller.selectedGiftKitName.add(
                    '${controller.selectedFastingMembersData[i].name!} - ${controller.selectedFastingMembersData[i].phoneNumber!}');
              }
            },
          ),
        ),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.onValidate();
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 30.00),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: ColorConstant.primaryColor,
                    borderRadius: BorderRadius.circular(8)),
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
        )
      ],
    );
  }
}
