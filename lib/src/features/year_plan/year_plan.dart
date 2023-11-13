import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../components/menu_component.dart';
import '../../constant/constant.dart';
import '../../provider/year_plan_controller.dart';
import '../../utils/utils.dart';

class YearPlan extends StatelessWidget {
  const YearPlan({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('headTextSplit'),
      drawer: Drawer(
        width: width * 0.8,
        child: const SingleChildScrollView(
          child: MenuComponent(),
        ),
      ),
      body: const SafeArea(bottom: false, child: YearPlanView()),
    );
  }
}

class YearPlanView extends StatefulWidget {
  const YearPlanView({super.key});

  @override
  State<YearPlanView> createState() => _YearPlanViewState();
}

class _YearPlanViewState extends State<YearPlanView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<YearPlanController>(context);
    var height = MediaQuery.sizeOf(context).height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.03),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: const BoxDecoration(color: ColorConstant.headColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'YearPlan',
                  style: FontConstant.inter
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    provider.toAdd(context);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(08),
                      decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          borderRadius: BorderRadius.circular(06)),
                      child: Text(
                        'addNew',
                        style: FontConstant.inter.copyWith(
                            color: ColorConstant.whiteColor,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Consumer<YearPlanController>(
            builder: (context, ref, child) {
              return ref.loader
                  ? Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: height * 0.3),
                      child: Text('noDataMSG', style: FontConstant.inter),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.00),
                      child: ListView.builder(
                        itemCount: ref.yearData.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var data = ref.yearData[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16.00),
                            decoration: BoxDecoration(
                                color: ColorConstant.headColor,
                                border: Border.all(
                                    color: ColorConstant.primaryColor),
                                borderRadius: BorderRadius.circular(5)),
                            padding:
                                const EdgeInsets.symmetric(vertical: 15.00),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    Utils().convertDateTimeDisplay(
                                        data.dateTday.toString()),
                                    style: FontConstant.inter.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                boxRow('charityTypeName',
                                    data.charityType?.name ?? ''),
                                boxRow('trackDistribution',
                                    data.trackDistribution.toString()),
                                boxRow('bibleDistribution',
                                    data.bibleDistribution.toString()),
                                boxRow('prayerMeetings',
                                    data.prayerMeetings.toString()),
                                boxRow(
                                    'bibleStudy', data.bibleStudy.toString()),
                                boxRow('Baptism', data.baptisam.toString()),
                                boxRow('fastingPrayer',
                                    data.fastingPrayer.toString()),
                                boxRow('youthFellowship',
                                    data.youthFellowship.toString()),
                                boxRow('womenFellowship',
                                    data.womensFellowship.toString()),
                                boxRow('sundaySchool',
                                    data.sundaySchool.toString()),
                                boxRow('churchCommittee',
                                    data.churchCommittee.toString()),
                                boxRow('receipts', data.receipts.toString()),
                                boxRow('payments', data.payments.toString()),
                                boxRow('CharityWorks',
                                    data.charityWorks.toString()),
                                boxRow('villages', data.villages.toString()),
                                boxRow(
                                    'evangelists', data.evangelists.toString()),
                                boxRow('educationAid',
                                    data.educationAid.toString()),
                                boxRow('educationKits',
                                    data.educationKit.toString()),
                                boxRow(
                                    'marriageAid', data.marriageAid.toString()),
                                boxRow('widowAid', data.widowAid.toString()),
                                boxRow('aidDifferentlyAbled',
                                    data.aidForDifferentlyAbled.toString()),
                                boxRow(
                                    'medicalAid', data.medicalAid.toString()),
                                boxRow('houseConstructionAid',
                                    data.houseConstructionAid.toString()),
                                boxRow('otherAid', data.otherAid.toString()),
                                data.remarks != null
                                    ? boxRow('charityRemark',
                                        data.remarks.toString())
                                    : const SizedBox(),
                              ],
                            ),
                          );
                        },
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}

Container boxRow(String lead, String response) => Container(
      margin: const EdgeInsets.only(top: 12.00, left: 15.00),
      child: Row(
        children: [
          Text(
            "$lead : ",
            style: FontConstant.inter.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            response,
            style: FontConstant.inter,
          )
        ],
      ),
    );
