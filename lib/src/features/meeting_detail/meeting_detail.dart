import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/meeting_detail_controller.dart';
import '../../utils/utils.dart';
import '../../widget/head_list_widget.dart';

class MeetingDetail extends StatelessWidget {
  const MeetingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('headTextSplit'),
      body: SafeArea(
          bottom: false,
          child: Consumer<MeetingDetailController>(
            builder: (context, controller, child) {
              return controller.screenLoader
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: ColorConstant.primaryColor),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: ListView(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12.00),
                            decoration: BoxDecoration(
                                color: ColorConstant.headColor,
                                border: Border.all(
                                    color: ColorConstant.primaryColor),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadListWidget(
                                    value: Utils().convertDateTimeDisplay(
                                        controller.modelData.data!.dateTday
                                            .toString()),
                                    leadValue: 'Date'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller.modelData.data!.reason
                                        .toString(),
                                    leadValue: 'Reason'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller.modelData.data!
                                        .masterSundayWorship!.name
                                        .toString(),
                                    leadValue: 'SundayWorshipMaster'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller
                                        .modelData.data!.baptizedBelievers
                                        .toString(),
                                    leadValue: 'baptizedBelievers'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller
                                        .modelData.data!.baptizedBelievers
                                        .toString(),
                                    leadValue: 'nonBaptizedBelievers'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller
                                        .modelData.data!.evangelists
                                        .toString(),
                                    leadValue: 'evangelist'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller.modelData.data!.guests
                                        .toString(),
                                    leadValue: 'guests'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller.modelData.data!.startTime
                                        .toString(),
                                    leadValue: 'startTime'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller.modelData.data!.endTime
                                        .toString(),
                                    leadValue: 'endTime'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller
                                        .modelData.data!.offertoryAmount
                                        .toString(),
                                    leadValue: 'offerAmount'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller
                                        .modelData.data!.worshipExpenseAmount
                                        .toString(),
                                    leadValue: 'worshipExpenseAmount'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller.modelData.data!.payment
                                        .toString(),
                                    leadValue: 'donationReceived'),
                                const SizedBox(height: 5),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller.modelData.data!.children
                                        .toString(),
                                    leadValue: 'AddMeetingChildren'),
                                const SizedBox(height: 5),
                                HeadListWidget(
                                    value: controller
                                        .modelData.data!.isAttendance
                                        .toString(),
                                    leadValue: 'AddMeetingMarkAttendance'),
                                const SizedBox(height: 5),
                                Text('AddMeetingSelectMember',
                                    style: FontConstant.inter
                                        .copyWith(fontWeight: FontWeight.w900)),
                                if (controller.modelData.data!.memberID != null)
                                  Text(controller.modelData.data!.memberID),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.toEdit(context);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 20.00),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.00, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Text(
                                          'edit',
                                          style: FontConstant.inter.copyWith(
                                              color: ColorConstant.whiteColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
            },
          )),
    );
  }
}
