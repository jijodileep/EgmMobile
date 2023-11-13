import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../model/all_family_model.dart';
import '../../model/all_village_model.dart';
import '../../provider/add_daily_report_controller.dart';
import '../../utils/utils.dart';

class AddDailyReportScreen extends StatelessWidget {
  const AddDailyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('AddDailyReport'),
      body: const SafeArea(bottom: false, child: AddDailyReportView()),
    );
  }
}

class AddDailyReportView extends StatelessWidget {
  const AddDailyReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDailyReportController>(
      builder: (context, ref, child) {
        return ref.addDailyReportLoader
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorConstant.primaryColor,
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 15.00, vertical: 15.00),
                child: Form(
                  key: ref.addDailyReportFormKey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 10.00),
                      GestureDetector(
                        onTap: () {
                          ref.selectDOB(context);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: uploadPhoto(),
                            padding:
                                const EdgeInsets.symmetric(vertical: 08.00),
                            child: Center(
                                child: Text(
                                    '${'Date'}: ${Utils().convertDateTimeDisplay(ref.selectedDOB.toString())}',
                                    style: FontConstant.inter))),
                      ),
                      const SizedBox(height: 10.00),
                      Utils().convertDateTimeDisplay(
                                      ref.selectedDOB.toString()) ==
                                  Utils().convertDateTimeDisplay(
                                      DateTime.now().toString()) &&
                              ref.isLeave == false
                          ? Container()
                          : TextFormField(
                              controller: ref.reasonController,
                              decoration: reasonName(),
                              maxLines: 4,
                            ),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text('isLeave', style: FontConstant.inter),
                        checkColor: Colors.white,
                        activeColor: ColorConstant.primaryColor,
                        controlAffinity: ListTileControlAffinity.leading,
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        value: ref.isLeave == true,
                        onChanged: (val) {
                          val ?? true
                              ? ref.isLeave = true
                              : ref.isLeave = false;
                        },
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 10.00),
                          Consumer<AddDailyReportController>(
                            builder: (context, ref, child) {
                              return MultiSelectDialogField(
                                items: ref.villageData
                                    .map((element) =>
                                        MultiSelectItem<VillageData>(
                                            element, element.name!))
                                    .toList(),
                                title:
                                    Text("village", style: FontConstant.inter),
                                selectedColor: ColorConstant.primaryColor,
                                decoration: uploadPhoto(),
                                buttonText: Text("Select_Your_Village",
                                    style: FontConstant.inter),
                                onConfirm: (results) {
                                  List<VillageData> selectVillage = [];
                                  selectVillage = results;
                                  ref.selectedVillages = [];
                                  for (int i = 0;
                                      i < selectVillage.length;
                                      i++) {
                                    ref.selectedVillages
                                        .add(selectVillage[i].id!);
                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 20.00),
                          Consumer<AddDailyReportController>(
                              builder: (context, ref, child) {
                            return MultiSelectDialogField(
                              items: ref.familyData
                                  .map((element) => MultiSelectItem<FamilyData>(
                                      element, element.name!))
                                  .toList(),
                              title:
                                  Text("HouseName", style: FontConstant.inter),
                              selectedColor: ColorConstant.primaryColor,
                              decoration: uploadPhoto(),
                              buttonText:
                                  Text("HouseVisit", style: FontConstant.inter),
                              onConfirm: (results) {
                                List<FamilyData> selectHouse = [];
                                selectHouse = results;
                                ref.selectedHouses = [];
                                for (int i = 0; i < selectHouse.length; i++) {
                                  ref.selectedHouses.add(selectHouse[i].id!);
                                }
                              },
                            );
                          }),
                          const SizedBox(height: 20.00),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: ref.distanceController,
                                  decoration: textField('distanceTravelled'),
                                  validator: Utils.validateEmpty,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: ref.fastingPrayer,
                                  decoration: textField('fastingPrayer'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextFormField(
                                  controller: ref.youthFellowship,
                                  decoration: textField('youthFellowship'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.00),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: ref.womenFellowship,
                                  decoration: textField('womenFellowship'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextFormField(
                                  controller: ref.cottageMeeting,
                                  decoration: textField('cottageMeeting'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.00),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: ref.churchCommittee,
                                  decoration: textField('churchCommittee'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextFormField(
                                  controller: ref.sundaySchool,
                                  decoration: textField('sundaySchool'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.00),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: ref.tractDistribution,
                                  decoration: textField('trackDistribution'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextFormField(
                                  controller: ref.bibleDistribution,
                                  decoration: textField('bibleDistribution'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.00),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: ref.prayerMeetings,
                                  decoration: textField('prayerMeetings'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextFormField(
                                  controller: ref.bibleStudy,
                                  decoration: textField('bibleStudy'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextFormField(
                                  controller: ref.baptism,
                                  decoration: textField('Baptism'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
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
                                  controller: ref.receiptsController,
                                  decoration: textField('receipts'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextFormField(
                                  controller: ref.paymentsController,
                                  decoration: textField('payments'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Consumer<AddDailyReportController>(
                        builder: (context, ref, child) {
                          return ref.submitAction
                              ? Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 33.00),
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(
                                    color: ColorConstant.primaryColor,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    ref.onCreate();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 33.00),
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.00),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(06.00)),
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
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
