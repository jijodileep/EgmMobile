import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../model/all_member_model.dart';
import '../../provider/add_sunday_controller.dart';
import '../../utils/utils.dart';

class AddSundayScreen extends StatelessWidget {
  const AddSundayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('addSunday'),
      body: SafeArea(
          bottom: false,
          child: Consumer<AddSundayController>(
            builder: (context, ref, child) {
              return ref.screenLoader
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: ColorConstant.primaryColor),
                    )
                  : const AddSundayView();
            },
          )),
    );
  }
}

class AddSundayView extends StatelessWidget {
  const AddSundayView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddSundayController>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.00, vertical: 15.00),
      child: Form(
        key: controller.addSundayFormKey,
        child: ListView(
          children: [
            const SizedBox(height: 10.00),
            GestureDetector(
              onTap: () {
                controller.selectDOB(context);
              },
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10.00),
                  decoration: uploadPhoto(),
                  padding: const EdgeInsets.symmetric(vertical: 8.00),
                  child: Center(
                      child: Text(
                          '${'Date'}: ${Utils().convertDateTimeDisplay(controller.selectedDOB.toString())}',
                          style: FontConstant.inter))),
            ),
            const SizedBox(height: 10.00),
            Consumer<AddSundayController>(
              builder: (context, ref, child) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10.00),
                  child: InputDecorator(
                    decoration: drop('SelectPrograms'),
                    child: DropdownButton(
                        underline: const SizedBox(),
                        isExpanded: true,
                        isDense: true,
                        hint: Text('SelectPrograms', style: FontConstant.inter),
                        value: controller.selectedSundayData.isNotEmpty
                            ? controller.selectedSundayData.toString()
                            : null,
                        items: controller.getMasterSundayWorshipsModel
                            .map((element) {
                          return DropdownMenuItem<String>(
                            value: element.id.toString(),
                            child: Text(
                              element.name.toString(),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controller.setSelected(newValue.toString());
                        }),
                  ),
                );
              },
            ),
            const SizedBox(height: 10.00),
            TextFormField(
              controller: controller.reasonController,
              decoration: textField('MeetingName'),
              maxLines: 4,
            ),
            const SizedBox(height: 10.00),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.baptizedBelieversController,
                    decoration: textField('baptizedBelievers'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    controller: controller.nonBaptizedBelieversController,
                    decoration: textField('nonBaptizedBelievers'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    controller: controller.evangelistController,
                    decoration: textField('evangelist'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.00),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.guestsController,
                    decoration: textField('guests'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    controller: controller.childrenController,
                    decoration: textField('AddMeetingChildren'),
                    // validator: Utils.validateEmpty,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    controller: controller.offerAmountController,
                    decoration: textField('offerAmount'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.00),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.startController,
                    decoration: textField('startTime'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    controller: controller.endController,
                    decoration: textField('endTime'),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.00),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.worshipExpenseAmountController,
                    decoration: textField('worshipExpenseAmount'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    controller: controller.paymentController,
                    decoration: textField('donationReceived'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.00),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title:
                  Text('AddMeetingMarkAttendance', style: FontConstant.inter),
              checkColor: Colors.white,
              activeColor: ColorConstant.primaryColor,
              controlAffinity: ListTileControlAffinity.leading,
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: controller.attendance == true,
              onChanged: (val) {
                val ?? true
                    ? controller.attendance = true
                    : controller.attendance = false;
              },
            ),
            controller.attendance == true
                ? MultiSelectDialogField(
                    items: controller.fastingMembersData
                        .map((element) => MultiSelectItem<MemberData>(element,
                            '${element.name!} - ${element.phoneNumber}'))
                        .toList(),
                    title: Text("members", style: FontConstant.inter),
                    selectedColor: ColorConstant.primaryColor,
                    decoration: uploadPhoto(),
                    autovalidateMode: AutovalidateMode.always,
                    buttonText: Text("AddMeetingSelectMember",
                        style: FontConstant.inter),
                    onConfirm: (results) {
                      List<MemberData> selectMembers = [];
                      selectMembers = results;

                      controller.selectedGiftKitName = [];
                      for (int i = 0; i < selectMembers.length; i++) {
                        controller.selectedGiftKitName.add(
                            '${selectMembers[i].name!} - ${selectMembers[i].phoneNumber!}');
                      }
                    },
                  )
                : const SizedBox(),
            const SizedBox(height: 20.00),
            Consumer<AddSundayController>(
              builder: (context, ref, child) {
                return controller.submitAction
                    ? Container(
                        margin: const EdgeInsets.symmetric(vertical: 33.00),
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          color: ColorConstant.primaryColor,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.onCreate();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 33.00),
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.symmetric(vertical: 10.00),
                          decoration: BoxDecoration(
                              color: ColorConstant.primaryColor,
                              borderRadius: BorderRadius.circular(06.00)),
                          alignment: Alignment.center,
                          child: Text(
                            'Create',
                            style: FontConstant.inter.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.whiteColor),
                          ),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
