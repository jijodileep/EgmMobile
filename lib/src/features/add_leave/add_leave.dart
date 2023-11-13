import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/add_leave_controller.dart';
import '../../utils/utils.dart';

class AddLeave extends StatelessWidget {
  const AddLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('addSunday'),
      body: const SafeArea(bottom: false, child: AddLeaveView()),
    );
  }
}

class AddLeaveView extends StatelessWidget {
  const AddLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddLeaveController>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15.00),
      child: Form(
        key: provider.addLeaveFormKey,
        child: ListView(
          children: [
            const SizedBox(height: 10.00),
            GestureDetector(
              onTap: () {
                provider.selectDOB(context);
              },
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10.00),
                  decoration: uploadPhoto(),
                  padding: const EdgeInsets.symmetric(vertical: 8.00),
                  child: Center(
                      child: Text(
                          '${'Date'}: ${Utils().convertDateTimeDisplay(provider.selectedDOB.toString())}',
                          style: FontConstant.inter))),
            ),
            const SizedBox(height: 10.00),
            const SizedBox(height: 10.00),
            TextFormField(
              controller: provider.reasonController,
              decoration: reasonName(),
              validator: Utils.validateEmpty,
              maxLines: 4,
            ),
            const SizedBox(height: 10.00),
            provider.submitAction
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 33),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: ColorConstant.primaryColor,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      provider.onCreate();
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
                  ),
          ],
        ),
      ),
    );
  }
}
