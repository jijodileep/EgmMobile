import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/daily_detail_controller.dart';
import '../../utils/utils.dart';

class DailyDetail extends StatefulWidget {
  const DailyDetail({super.key});

  @override
  State<DailyDetail> createState() => _DailyDetailState();
}

class _DailyDetailState extends State<DailyDetail> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DailyDetailController>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorConstant.primaryColor,
          title: const Text('Details'),
        ),
        body: controller.loader
            ? const Center(
                child: CircularProgressIndicator(
                color: ColorConstant.primaryColor,
              ))
            : controller.data.first.isLeave == true
                ? Column(
                    children: [
                      const SizedBox(height: 30.00),
                      Center(
                        child: Text(
                            Utils().convertDateTimeDisplay(
                              controller.data.first.dateTday.toString(),
                            ),
                            style: FontConstant.inter.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 16.00),
                      Text('isLeave',
                          style: FontConstant.inter.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold))
                    ],
                  )
                : ListView(
                    children: [
                      const SizedBox(height: 30.00),
                      Center(
                        child: Text(
                            Utils().convertDateTimeDisplay(
                              controller.data.first.dateTday.toString(),
                            ),
                            style: FontConstant.inter.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),

                      const SizedBox(height: 16.00),
                      controller.data.first.reason != ""
                          ? Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.00),
                              child: Text(
                                  controller.data.first.reason.toString(),
                                  style: FontConstant.inter.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            )
                          : Container(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.00, vertical: 08.00),
                        child: Row(
                          children: [
                            Text('${'visitedVillages'} : ',
                                style: FontConstant.inter),
                            Text(controller.data.first.visitedVillages
                                .toString()),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.00, vertical: 08.00),
                        child: Row(
                          children: [
                            Text('${'visitedHouses'} : ',
                                style: FontConstant.inter),
                            Text(controller.data.first.visitedHoueses
                                .toString()),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.00, vertical: 08.00),
                        child: Row(
                          children: [
                            Text('${'distanceTravelled'} : ',
                                style: FontConstant.inter),
                            Text(
                                '${controller.data.first.distanceTravelled}KM'),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.00, vertical: 08.00),
                        child: Row(
                          children: [
                            Text('${'receipts'} : ', style: FontConstant.inter),
                            Text('${controller.data.first.receipts}'),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.00, vertical: 08.00),
                        child: Row(
                          children: [
                            Text('${'payments'} : ', style: FontConstant.inter),
                            Text('${controller.data.first.payments}'),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.00, vertical: 08.00),
                        child: Row(
                          children: [
                            Text('${'CreatedDate'} : ',
                                style: FontConstant.inter),
                            Text(Utils().convertDateTimeDisplay(
                                controller.data.first.createdDate.toString())),
                          ],
                        ),
                      ),
//  /// Fasting prayer section
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 4),
                        child: Row(
                          children: [
                            Text(
                              "${'fastingPrayer'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.first.fastingPrayer.toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),

//  /// youth Fellowship section
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 12.00),
                        child: Row(
                          children: [
                            Text(
                              "${'youthFellowship'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.first.youthFellowship.toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),

//  /// women Fellowship section
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 12.00),
                        child: Row(
                          children: [
                            Text(
                              "${'womenFellowship'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.first.womensFellowship.toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),

//  /// women cottageMeeting section
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 12.00),
                        child: Row(
                          children: [
                            Text(
                              "${'cottageMeeting'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.first.cottageMeeting.toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),

//  /// women sundaySchool section
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 12.00),
                        child: Row(
                          children: [
                            Text(
                              "${'sundaySchool'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.first.sundaySchool.toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),

//  /// churchCommittee section
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 12.00),
                        child: Row(
                          children: [
                            Text(
                              "${'churchCommittee'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.first.churchCommittee.toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 12.00),
                        child: Row(
                          children: [
                            Text(
                              "${'trackDistribution'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 12.00),
                        child: Row(
                          children: [
                            Text(
                              "${'bibleDistribution'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.first.bibleDistribution
                                  .toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 12.00),
                        child: Row(
                          children: [
                            Text(
                              "${'prayerMeetings'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.first.prayerMeetings.toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 12.00),
                        child: Row(
                          children: [
                            Text(
                              "${'bibleStudy'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.first.bibleStudy.toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 12.00),
                        child: Row(
                          children: [
                            Text(
                              "${'Baptism'} : ",
                              style: FontConstant.inter,
                            ),
                            Text(
                              controller.data.first.baptisam.toString(),
                              style: FontConstant.inter,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 20.00),
                        child: Column(
                          children: [
                            Text(
                              'HouseVisit',
                              style: FontConstant.inter.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            ListView.builder(
                              itemCount: controller.houses.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var data = controller.houses[index];
                                return Text(
                                  data.family!.name!,
                                  style: FontConstant.inter,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.00)
                            .copyWith(top: 20.00),
                        child: Column(
                          children: [
                            Text(
                              'visitedVillages',
                              style: FontConstant.inter.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            ListView.builder(
                              itemCount: controller.villages.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var data = controller.villages[index];
                                return Text(
                                  data.village!.name!,
                                  style: FontConstant.inter,
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ));
  }
}

class MemberListWidget extends StatelessWidget {
  const MemberListWidget({
    Key? key,
    required this.type,
    required this.head,
  }) : super(key: key);
  final String head, type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 20.00).copyWith(top: 20.00),
      child: Consumer<DailyDetailController>(builder: (context, ref, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
              itemCount: ref.details.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var data = ref.details[index];
                return data.type == type
                    ? Text(
                        data.familyMember!.name!,
                        style: FontConstant.inter,
                      )
                    : Container();
              },
            ),
          ],
        );
      }),
    );
  }
}
