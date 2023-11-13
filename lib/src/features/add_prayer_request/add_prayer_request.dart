import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/add_prayer_request_controller.dart';
import '../../utils/utils.dart';

class AddPrayerRequest extends StatelessWidget {
  const AddPrayerRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('AddPrayerRequest'),
      body: const SafeArea(bottom: false, child: AddPrayerView()),
    );
  }
}

class AddPrayerView extends StatelessWidget {
  const AddPrayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPrayerRequestController>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.00, vertical: 15.00),
      child: Form(
        key: provider.addPrayerRequestFormKey,
        child: ListView(children: [
          const SizedBox(height: 10.00),
          TextFormField(
            controller: provider.nameController,
            decoration: textField('Name'),
            validator: Utils.validateEmpty,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 10.00),
          TextFormField(
            controller: provider.descriptionController,
            decoration: textField('description'),
            validator: Utils.validateEmpty,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 10.00),
          Consumer<AddPrayerRequestController>(
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
        ]),
      ),
    );
  }
}
