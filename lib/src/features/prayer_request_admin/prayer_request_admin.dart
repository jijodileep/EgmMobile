import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/prayer_request_admin_controller.dart';

class PrayerRequestAdmin extends StatelessWidget {
  const PrayerRequestAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('PrayerRequest'),
      body: const SafeArea(bottom: false, child: AdminPrayerView()),
    );
  }
}

class AdminPrayerView extends StatefulWidget {
  const AdminPrayerView({super.key});

  @override
  State<AdminPrayerView> createState() => _AdminPrayerViewState();
}

class _AdminPrayerViewState extends State<AdminPrayerView> {
  @override
  Widget build(BuildContext context) {
    TextStyle headStyle =
        FontConstant.inter.copyWith(fontWeight: FontWeight.bold);
    TextStyle cellStyle = FontConstant.inter.copyWith(fontSize: 12);
    final controller = Provider.of<PrayerRequestAdminController>(context);

    var height = MediaQuery.sizeOf(context).height;

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
                'PrayerRequest',
                style: FontConstant.inter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  controller.toAddReport(context);
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

        Consumer<PrayerRequestAdminController>(builder: (context, ref, child) {
          return ref.prayerLoader
              ? const Center(
                  child: CircularProgressIndicator(
                      color: ColorConstant.primaryColor),
                )
              : ref.prayerRequest.isEmpty
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
                            DataColumn(
                                label: Text('description', style: headStyle)),
                          ],
                          rows:
                              List.generate(ref.prayerRequest.length, (index) {
                            var data = ref.prayerRequest[index];
                            final no = index + 1;
                            final name = data.name;
                            final description = data.description;

                            return DataRow(
                                color: MaterialStateColor.resolveWith((states) {
                                  return index % 2 == 0
                                      ? ColorConstant.headColor
                                      : ColorConstant
                                          .dataCellColor1; //make tha magic!
                                }),
                                cells: [
                                  DataCell(
                                      Text(no.toString(), style: cellStyle)),
                                  DataCell(
                                      Text(name.toString(), style: cellStyle)),
                                  DataCell(Text(
                                    description.toString(),
                                    style: cellStyle,
                                  )),
                                ]);
                          })),
                    );
        }),
      ],
    );
  }
}
