import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/edit_meeting_controller.dart';
import '../../utils/utils.dart';

class EditMeeting extends StatelessWidget {
  const EditMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('EditMeeting'),
      body: SafeArea(
          bottom: false,
          child: Consumer<EditMeetingController>(
            builder: (context, ref, child) {
              /// This code is using the `Consumer` widget from the `provider` package to listen to changes
              /// in the `EditMeetingController` and rebuild the UI accordingly.
              return ref.screenLoader
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: ColorConstant.primaryColor),
                    )
                  : const EditSundayView();
            },
          )),
    );
  }
}

class EditSundayView extends StatefulWidget {
  const EditSundayView({super.key});

  @override
  State<EditSundayView> createState() => _EditSundayViewState();
}

class _EditSundayViewState extends State<EditSundayView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EditMeetingController>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Form(
        key: controller.editSundayFormKey,
        child: ListView(
          children: [
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
                          '${'Date'}: ${Utils().convertDateTimeDisplay(controller.selectedDOB.toString())}',
                          style: FontConstant.inter))),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: InputDecorator(
                decoration: drop('SelectPrograms'),
                child: DropdownButton(
                    underline: const SizedBox(),
                    isExpanded: true,
                    isDense: true,
                    hint: Text('SelectPrograms', style: FontConstant.inter),

                    /// The line `value: controller.selectedSundayData.isNotEmpty ?
                    /// controller.selectedSundayData.toString() : null,` is setting the initial value of
                    /// a DropdownButton widget based on the value of `controller.selectedSundayData`.
                    value: controller.selectedSundayData.isNotEmpty
                        ? controller.selectedSundayData.toString()
                        : null,
                    items:
                        controller.getMasterSundayWorshipsModel.map((element) {
                      return DropdownMenuItem<String>(
                        value: element.id.toString(),
                        child: Text(
                          element.name.toString(),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        /// In the code snippet provided,
                        /// `controller.setSelected(newValue.toString());` is a method call on the
                        /// `controller` object.
                        controller.setSelected(newValue.toString());
                      });
                    }),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.reasonController,
              decoration: textField('MeetingName'),
              maxLines: 4,
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
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
                    controller: controller.offerAmountController,
                    decoration: textField('offerAmount'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    controller: controller.worshipExpenseAmountController,
                    decoration: textField('worshipExpenseAmount'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.startController,
                    decoration: textField('startTime'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    controller: controller.endController,
                    decoration: textField('endTime'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.receiptsController,
                    decoration: textField('TotalReceipts'),
                    // validator: Utils.validateEmpty,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    controller: controller.paymentController,
                    decoration: textField('TotalPayments'),
                    // validator: Utils.validateEmpty,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.00),
            controller.updateAction
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 33),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: ColorConstant.primaryColor,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      controller.onUpdate();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 33),
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
                  )
          ],
        ),
      ),
    );
  }
}
