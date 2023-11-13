import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import '../../constant/constant.dart';
import '../../model/all_member_model.dart';
import '../../provider/add_gift_controller.dart';
import '../../utils/utils.dart';

class AddGift extends StatelessWidget {
  const AddGift({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddGiftController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('EducationalKit'),
      ),
      body: SafeArea(child: Consumer(
        builder: (context, ref, child) {
          return provider.secondPhase
              ? const AddStudent()
              : const AddGiftView();
        },
      )),
    );
  }
}

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddGiftController>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.00, vertical: 20.00),
      child: ListView(
        children: [
          Form(
            key: provider.addGiftFormKey,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.selectedGiftKitName.length,
              itemBuilder: (BuildContext context, int index) {
                var data = provider.selectedGiftKitName[index];
                provider.textControllers!.add(TextEditingController());
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data,
                      style: FontConstant.inter
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10.00),
                    TextFormField(
                      controller: provider.textControllers?[index],
                      decoration: textField('markRemark'),
                      validator: Utils.validateEmpty,
                    ),
                    const SizedBox(height: 10.00),
                    const Divider(),
                    const SizedBox(height: 10.00),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<AddGiftController>(
                builder: (context, ref, child) {
                  return ref.saveLoader
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorConstant.primaryColor,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            ref.onCreate();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 30.00),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                color: ColorConstant.primaryColor,
                                borderRadius: BorderRadius.circular(8)),
                            alignment: Alignment.center,
                            child: Text(
                              'Save',
                              style: FontConstant.inter.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.whiteColor),
                            ),
                          ),
                        );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class AddGiftView extends StatelessWidget {
  const AddGiftView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddGiftController>(
      builder: (context, ref, child) {
        return ref.loader
            ? const Center(
                child: CircularProgressIndicator(
                    color: ColorConstant.primaryColor))
            : ListView(
                children: [
                  Consumer<AddGiftController>(
                    builder: (context, ref, child) {
                      return GestureDetector(
                        onTap: () {
                          ref.selectDOB(context);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 10,
                                left: 20.00,
                                right: 20.00,
                                top: 20.00),
                            decoration: uploadPhoto(),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                                child: Text(
                                    '${'Date'}: ${Utils().convertDateTimeDisplay(ref.selectedDOB.toString())}',
                                    style: FontConstant.inter))),
                      );
                    },
                  ),

                  const SizedBox(height: 10.00),

                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 10.00, left: 20.00, right: 20.00),
                    child: InputDecorator(
                      decoration: drop('SelectType'),
                      child: DropdownButton(
                          underline: const SizedBox(),
                          isExpanded: true,
                          isDense: true,
                          hint: Text('SelectType', style: FontConstant.inter),
                          value: ref.selectedGiftData.isNotEmpty
                              ? ref.selectedGiftData.toString()
                              : null,
                          items: ref.giftType.map((element) {
                            return DropdownMenuItem<String>(
                              value: element.id.toString(),
                              child: Text(
                                element.name.toString(),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            ref.setSelectedGift(newValue.toString());
                          }),
                    ),
                  ),
                  const SizedBox(height: 10.00),

                  //  ///
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.00),
                    child: MultiSelectDialogField(
                      items: ref.fastingMembersData
                          .map((element) => MultiSelectItem<MemberData>(element,
                              '${element.name!} - ${element.phoneNumber}'))
                          .toList(),
                      title: Text("members", style: FontConstant.inter),
                      selectedColor: ColorConstant.primaryColor,
                      decoration: uploadPhoto(),
                      autovalidateMode: AutovalidateMode.always,
                      buttonText:
                          Text("SelectStudent", style: FontConstant.inter),
                      onConfirm: (results) {
                        List<MemberData> selectMembers = [];
                        selectMembers = results;
                        ref.selectedGiftKitId = [];
                        ref.selectedGiftKitName = [];
                        for (int i = 0; i < selectMembers.length; i++) {
                          ref.selectedGiftKitId.add(selectMembers[i].id!);
                          ref.selectedGiftKitName.add(
                              '${selectMembers[i].name!} - ${selectMembers[i].phoneNumber!}');
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ref.btnLoader
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: ColorConstant.primaryColor,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                ref.onValidate();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 30.00),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                    color: ColorConstant.primaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                                alignment: Alignment.center,
                                child: Text(
                                  'Next',
                                  style: FontConstant.inter.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.whiteColor),
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              );
      },
    );
  }
}
