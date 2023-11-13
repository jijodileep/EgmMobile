import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../components/menu_component.dart';
import '../../constant/constant.dart';
import '../../provider/membership_controller.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

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
      body: const SafeArea(bottom: false, child: MembershipView()),
    );
  }
}

class MembershipView extends StatefulWidget {
  const MembershipView({super.key});

  @override
  State<MembershipView> createState() => _MembershipViewState();
}

class _MembershipViewState extends State<MembershipView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    final controller = Provider.of<MembershipController>(context);
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.only(top: height * 0.03),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: const BoxDecoration(color: ColorConstant.headColor),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.toCreateFamily(context);
                },
                child: Container(
                    padding: const EdgeInsets.all(08),
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(06)),
                    child: Text(
                      'createHeadOfTheFamily',
                      style: FontConstant.inter.copyWith(
                          color: ColorConstant.whiteColor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(height: 12.00),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'List_Head_of_the_families',
                    style: FontConstant.inter
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        Consumer<MembershipController>(
          builder: (context, ref, child) {
            TextStyle headStyle =
                FontConstant.inter.copyWith(fontWeight: FontWeight.bold);
            TextStyle cellStyle = FontConstant.inter.copyWith(fontSize: 12);
            return ref.familyData.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: height * 0.3),
                    child: Text('noDataMSG', style: FontConstant.inter),
                  )
                : DataTable(
                    showBottomBorder: false,
                    columnSpacing: 12.0,
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => ColorConstant.dataCellColor1),
                    border: const TableBorder(
                        horizontalInside: BorderSide(
                            width: 3,
                            color: ColorConstant.whiteColor,
                            style: BorderStyle.solid)),
                    columns: [
                      DataColumn(label: Text('No', style: headStyle)),
                      DataColumn(label: Text('Name', style: headStyle)),
                      DataColumn(label: Text('House_Name', style: headStyle)),
                      DataColumn(label: Text('village', style: headStyle)),
                    ],
                    rows: List.generate(ref.familyData.length, (index) {
                      var data = ref.familyData[index];
                      final no = index + 1;
                      final name = data.nameOfHead;
                      final houseName = data.family!.name;
                      final place = '${data.family!.village!.name}';

                      return DataRow(
                          color: MaterialStateColor.resolveWith((states) {
                            return index % 2 == 0
                                ? ColorConstant.headColor
                                : ColorConstant
                                    .dataCellColor1; //make tha magic!
                          }),
                          cells: [
                            DataCell(
                              Text(no.toString(), style: cellStyle),
                              onTap: () {
                                controller.toMember(data.family!.id.toString());
                              },
                            ),
                            DataCell(
                                Text(
                                  name.toString(),
                                  style: cellStyle,
                                ), onTap: () {
                              controller.toMember(data.family!.id.toString());
                            }),
                            DataCell(
                                SizedBox(
                                    width: 120,
                                    child: Text(houseName.toString(),
                                        style: cellStyle)), onTap: () {
                              controller.toMember(data.family!.id.toString());
                            }),
                            DataCell(Text(place.toString(), style: cellStyle),
                                onTap: () {
                              controller.toMember(data.family!.id.toString());
                            }),
                          ]);
                    }),
                  );
          },
        )
      ],
    );
  }
}
