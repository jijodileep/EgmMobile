import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';

import '../../constant/constant.dart';
import '../../provider/prayer_controller.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('OfficeCommunications'),
      body: const SafeArea(bottom: false, child: SundayView()),
    );
  }
}

class SundayView extends StatefulWidget {
  const SundayView({super.key});

  @override
  State<SundayView> createState() => _SundayViewState();
}

class _SundayViewState extends State<SundayView> {
  @override
  Widget build(BuildContext context) {
    final ref = Provider.of<PrayerController>(context);

    var height = MediaQuery.sizeOf(context).height;
    TextStyle headStyle =
        FontConstant.inter.copyWith(fontWeight: FontWeight.bold);
    TextStyle cellStyle = FontConstant.inter.copyWith(fontSize: 12);
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.only(top: height * 0.03),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: const BoxDecoration(color: ColorConstant.headColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'OfficeCommunications',
                style: FontConstant.inter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  ref.toAddReport(context);
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
        // Data table

        ref.prayerRequest.isEmpty
            ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: height * 0.3),
                child: Text('noDataMSG', style: FontConstant.inter),
              )
            : Container(
                margin: EdgeInsets.only(top: height * 0.03),
                child: DataTable(
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
                      DataColumn(label: Text('description', style: headStyle)),
                    ],
                    rows: List.generate(ref.prayerRequest.length, (index) {
                      var data = ref.prayerRequest[index];
                      final no = index + 1;
                      final name = data.name;
                      final description = data.description;
                      final id = data.id;
                      action() {
                        ref.toDetails(id);
                      }

                      return DataRow(
                          color: MaterialStateColor.resolveWith((states) {
                            return index % 2 == 0
                                ? ColorConstant.headColor
                                : ColorConstant
                                    .dataCellColor1; //make tha magic!
                          }),
                          cells: [
                            DataCell(InkWell(
                                onTap: () {
                                  action();
                                },
                                child: Text(no.toString(), style: cellStyle))),
                            DataCell(InkWell(
                                onTap: () {
                                  action();
                                },
                                child:
                                    Text(name.toString(), style: cellStyle))),
                            DataCell(InkWell(
                              onTap: () {
                                action();
                              },
                              child: Text(description.toString(),
                                  style: cellStyle),
                            )),
                          ]);
                    })),
              )
      ],
    );
  }
}
