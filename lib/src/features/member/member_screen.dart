/// The `MemberScreen` class is a Flutter screen that displays a list of family members and their
/// details, including the family head, using data from the `MemberController` provider.
// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../../api/end_point.dart';
import '../../constant/constant.dart';
import '../../model/get_family_member_model.dart';
import 'member_details.dart';

import 'package:flutter/material.dart';

import '../../components/common_app_bar.dart';
import '../../provider/member_controller.dart';
import '../../widget/head_list_widget.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('headTextSplit'),
      body: const SafeArea(
        bottom: false,
        child: MemberView(),
      ),
    );
  }
}

class MemberView extends StatefulWidget {
  const MemberView({super.key});

  @override
  State<MemberView> createState() => _MemberViewState();
}

class _MemberViewState extends State<MemberView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    TextStyle headStyle =
        FontConstant.inter.copyWith(fontWeight: FontWeight.bold);
    TextStyle cellStyle = FontConstant.inter.copyWith(fontSize: 12);
    return Consumer<MemberController>(
      builder: (context, controller, child) {
        return controller.memberLoader
            ? const Center(
                child: CircularProgressIndicator(
                    color: ColorConstant.primaryColor))
            : ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height * 0.03),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    decoration:
                        const BoxDecoration(color: ColorConstant.headColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Families',
                          style: FontConstant.inter.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.toCreateMember(controller.familyId);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(08),
                              decoration: BoxDecoration(
                                  color: ColorConstant.primaryColor,
                                  borderRadius: BorderRadius.circular(06)),
                              child: Text(
                                'AddMember',
                                style: FontConstant.inter.copyWith(
                                    color: ColorConstant.whiteColor,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                  controller.familyMemberData.isEmpty
                      ? Center(
                          child: Text('noDataMSG', style: FontConstant.inter))
                      : ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var data = controller.familyMemberData[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: height * 0.02),
                                // head family section
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: FamilyHeadInfoComponent(
                                            data: data)),
                                    data.photo != null
                                        ? Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            child: CachedNetworkImage(
                                              imageUrl: EndPoint.imageUrl +
                                                  data.photo!,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    //image size fill
                                                    image: imageProvider,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  Container(
                                                alignment: Alignment.center,
                                                child: const CircularProgressIndicator(
                                                    color: ColorConstant
                                                        .primaryColor), // you can add pre loader Image as well to show loading.
                                              ), //show progress  while loading image
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.asset(
                                                AssetsConstant.logo,
                                                width: 82,
                                                height: 70,
                                              ),
                                              //show no image available image on error loading
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                                SizedBox(height: height * 0.02),
                                const Divider(
                                  thickness: 0.4,
                                  color: ColorConstant.textColor,
                                ),
                              ],
                            );
                          },
                        ),
                  // Family member list table.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: Text(
                          'Family members',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                      controller.familyMemberData.length > 1
                          ? DataTable(
                              showBottomBorder: false,
                              columnSpacing: width * 0.022,
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => ColorConstant.dataCellColor1),
                              border: const TableBorder(
                                  horizontalInside: BorderSide(
                                      width: 3,
                                      color: ColorConstant.whiteColor,
                                      style: BorderStyle.solid)),
                              columns: [
                                DataColumn(label: Text('No', style: headStyle)),
                                DataColumn(
                                    label: Text('Name', style: headStyle)),
                                DataColumn(
                                    label:
                                        Text('Phone_Number', style: headStyle)),
                                DataColumn(
                                    label: Center(
                                        child: Text('', style: headStyle))),
                              ],
                              rows: List.generate(
                                  controller.familyMemberDataWithoutHead.length,
                                  (index) {
                                var data = controller.familyMemberData[index];
                                final no = index + 1;
                                final name = data.name;
                                final phone = data.phoneNumber;
                                return DataRow(
                                    color: MaterialStateColor.resolveWith(
                                        (states) {
                                      return index % 2 == 0
                                          ? ColorConstant.headColor
                                          : ColorConstant
                                              .dataCellColor1; //make tha magic!
                                    }),
                                    cells: [
                                      DataCell(Text(no.toString(),
                                          style: cellStyle)),
                                      DataCell(SizedBox(
                                        width: 100,
                                        child: Text(name.toString(),
                                            style: cellStyle),
                                      )),
                                      DataCell(SizedBox(
                                        width: 100,
                                        child: Text(phone.toString(),
                                            style: cellStyle),
                                      )),
                                      DataCell(SizedBox(
                                        width: 98,
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return MemberDetailsScreen(
                                                      name: data.name ?? '',
                                                      phoneNumber:
                                                          data.phoneNumber ??
                                                              '',
                                                      photo: data.photo!,
                                                      gender: data.gender
                                                          .toString(),
                                                      age: data.age.toString(),
                                                      dob: data.dateOfBirth
                                                          .toString(),
                                                      education:
                                                          data.education ?? '',
                                                      dateOfMembership: data
                                                          .dateOfMembership
                                                          .toString(),
                                                      isBaptism: data.isBaptism
                                                          .toString(),
                                                      baptismChurch:
                                                          data.baptismChurch ??
                                                              '',
                                                      dateOfBaptism: data
                                                          .dateOfBaptism
                                                          .toString(),
                                                      occupation:
                                                          data.occupation ?? '',
                                                      isMarried: data.isMarried
                                                          .toString(),
                                                      relation: data.relations
                                                          .toString(),
                                                      isDead: data.isDead!,
                                                    );
                                                  }));
                                                },
                                                icon: const Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  size: 12,
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  controller.toEditMember(data);
                                                },
                                                icon: const Icon(
                                                  Icons.edit,
                                                  size: 12,
                                                ))
                                          ],
                                        ),
                                      ))
                                    ]);
                              }),
                            )
                          : Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: height * 0.08),
                              child:
                                  Text('noDataMSG', style: FontConstant.inter),
                            ),
                    ],
                  ),
                ],
              );
      },
    );
  }
}

class FamilyHeadInfoComponent extends StatelessWidget {
  const FamilyHeadInfoComponent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final FamilyMemberData data;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MemberController>(context);
    var width = MediaQuery.sizeOf(context).width;

    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadListWidget(leadValue: 'Name', value: data.name!),
          const SizedBox(height: 5),
          HeadListWidget(leadValue: 'Family_Name', value: data.family!.name!),
          const SizedBox(height: 5),
          HeadListWidget(
              leadValue: 'Age/DOB',
              value:
                  '${data.age} - ${data.dateOfBirth!.day}/${data.dateOfBirth!.month}/${data.dateOfBirth!.year}'),
          const SizedBox(height: 5),
          HeadListWidget(leadValue: 'PhoneNo', value: data.phoneNumber!),
          const SizedBox(height: 5),
          HeadListWidget(leadValue: 'Occupation', value: data.occupation!),
          const SizedBox(height: 5),
          HeadListWidget(leadValue: 'Place', value: data.family!.address),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              controller.toEditFamily(data);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: width * 0.23,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ColorConstant.primaryColor,
                  borderRadius: BorderRadius.circular(05)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'edit',
                    style: FontConstant.inter
                        .copyWith(color: ColorConstant.whiteColor),
                  ),
                  const SizedBox(width: 02),
                  const Icon(
                    Icons.edit,
                    color: ColorConstant.whiteColor,
                    size: 14,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
