import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/add_year_plan_controller.dart';
import '../../utils/utils.dart';

class AddYearPlan extends StatelessWidget {
  const AddYearPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('AddYearPlan'),
      body: const SafeArea(bottom: false, child: AddYearPlanView()),
    );
  }
}

class AddYearPlanView extends StatelessWidget {
  const AddYearPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddYearPlanController>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.00, vertical: 15.00),
      child: ListView(
        children: [
          Consumer<AddYearPlanController>(
            builder: (context, ref, child) {
              return GestureDetector(
                onTap: () {
                  ref.selectDOB(context);
                },
                child: Container(
                    margin: const EdgeInsets.only(bottom: 10.00),
                    decoration: uploadPhoto(),
                    padding: const EdgeInsets.symmetric(vertical: 8.00),
                    child: Center(
                        child: Text(
                            '${'Date'}: ${Utils().convertDateTimeDisplay(controller.selectedDOB.toString())}',
                            style: FontConstant.inter))),
              );
            },
          ),
          const SizedBox(height: 10.00),
          Container(
            margin: const EdgeInsets.only(bottom: 10.00),
            child: InputDecorator(
              decoration: drop('SelectYear'),
              child: DropdownButton(
                  underline: const SizedBox(),
                  isExpanded: true,
                  isDense: true,
                  hint: Text('SelectYear', style: FontConstant.inter),
                  value: controller.selectedCharityData.isNotEmpty
                      ? controller.selectedCharityData.toString()
                      : null,
                  items: controller.charityData.map((element) {
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.trackDistribution,
                  decoration: textField('trackDistribution'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.bibleDistribution,
                  decoration: textField('bibleDistribution'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.prayerMeetings,
                  decoration: textField('prayerMeetings'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.bibleStudy,
                  decoration: textField('bibleStudy'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.fastingPrayer,
                  decoration: textField('fastingPrayer'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.youthFellowship,
                  decoration: textField('youthFellowship'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              )
            ],
          ),
          const SizedBox(height: 12.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.womensFellowship,
                  decoration: textField('womenFellowship'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.sundaySchool,
                  decoration: textField('sundaySchool'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.churchCommittee,
                  decoration: textField('churchCommittee'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.evangelists,
                  decoration: textField('evangelists'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.baptisam,
                  decoration: textField('Baptism'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.villages,
                  decoration: textField('NewVillage'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.educationAid,
                  decoration: textField('educationAid'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.educationKit,
                  decoration: textField('educationKits'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.marriageAid,
                  decoration: textField('marriageAid'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.widowAid,
                  decoration: textField('widowAid'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.disable,
                  decoration: textField('aidDifferentlyAbled'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.medicalAid,
                  decoration: textField('medicalAid'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.houseAid,
                  decoration: textField('houseConstructionAid'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.otherAid,
                  decoration: textField('otherAid'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.receipts,
                  decoration: textField('receipts'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.payments,
                  decoration: textField('payments'),
                  validator: Utils.validateEmpty,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.00),
          TextFormField(
            controller: controller.remark,
            decoration: textField('charityRemark'),
            // validator: Utils.validateEmpty,
            keyboardType: TextInputType.text,
            minLines: 4,
            maxLines: 12,
          ),
          Consumer<AddYearPlanController>(
            builder: (context, ref, child) {
              return ref.loader
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 33.00),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: ColorConstant.primaryColor,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        controller.onSave();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 33.00),
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
          ),
        ],
      ),
    );
  }
}
