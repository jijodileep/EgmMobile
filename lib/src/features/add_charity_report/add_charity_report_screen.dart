/// The code above defines a Dart class called AddCharityReportScreen that displays a form for adding a
/// charity report, with various text fields and buttons.
import 'package:egm_developer_mode/src/provider/add_charity_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../utils/utils.dart';

class AddCharityReportScreen extends StatelessWidget {
  const AddCharityReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// The code is creating a Scaffold widget, which is a basic layout structure for a screen in Flutter.
    return Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        appBar: commonAppBar('addCharityWorks'),
        resizeToAvoidBottomInset: true,
        body: Consumer<AddCharityReportController>(
          builder: (context, ref, child) {
            if (ref.screenLoader == true) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorConstant.primaryColor,
                ),
              );
            } else {
              return const AddYearReportView();
            }
          },
        ));
  }
}

class AddYearReportView extends StatelessWidget {
  const AddYearReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddCharityReportController>(context);

    return ListView(
      children: [
        Container(
          margin:
              const EdgeInsets.symmetric(horizontal: 15.00, vertical: 15.00),
          child: Form(
            key: provider.addYearReportFormKey,
            child: Column(
              children: [
                const SizedBox(height: 10.00),
                Consumer<AddCharityReportController>(
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
                                  '${'Date'}: ${Utils().convertDateTimeDisplay(ref.selectedDOB.toString())}',
                                  style: FontConstant.inter))),
                    );
                  },
                ),
                const SizedBox(height: 10.00),
                Consumer<AddCharityReportController>(
                  builder: (context, ref, child) {
                    return Utils().convertDateTimeDisplay(
                                ref.selectedDOB.toString()) ==
                            Utils().convertDateTimeDisplay(
                                DateTime.now().toString())
                        ? Container()
                        : TextFormField(
                            controller: ref.reasonController,
                            decoration: reasonName(),
                            maxLines: 4,
                          );
                  },
                ),
                const SizedBox(height: 10.00),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: provider.educationController,
                        decoration: textField('educationAid'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        controller: provider.educationKidsController,
                        decoration: textField('EducationKitsDistribution'),
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
                        controller: provider.marriageAidController,
                        decoration: textField('marriageAid'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        controller: provider.widowAidController,
                        decoration: textField('widowAid'),
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
                        controller: provider.differentlyController,
                        decoration: textField('AidDifferently-abled'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        controller: provider.medicalController,
                        decoration: textField('medicalAid'),
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
                        controller: provider.houseController,
                        decoration: textField('houseConstructionAid'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        controller: provider.otherController,
                        decoration: textField('otherAid'),
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
                        controller: provider.receiptsController,
                        decoration: textField('TotalReceipts'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        controller: provider.paymentController,
                        decoration: textField('TotalPayments'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.00),
                TextField(
                  controller: provider.remarkController,
                  decoration: textField('charityRemark'),
                  keyboardType: TextInputType.text,
                  minLines: 4,
                  maxLines: 18,
                ),
                const SizedBox(height: 10.00),
                Consumer<AddCharityReportController>(
                  builder: (context, ref, child) {
                    return ref.submitAction
                        ? Container(
                            margin: const EdgeInsets.symmetric(vertical: 33.00),
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              color: ColorConstant.primaryColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              ref.onCreate();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 33.00),
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.00),
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
        ),
      ],
    );
  }
}
