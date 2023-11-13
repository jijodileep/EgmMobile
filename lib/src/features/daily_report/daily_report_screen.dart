import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../components/menu_component.dart';
import '../../constant/constant.dart';
import '../../data/app_data.dart';
import '../../extension/datepicker_dropdown.dart';
import '../../provider/daily_report_controller.dart';
import '../../utils/utils.dart';

class DailyReportScreen extends StatelessWidget {
  const DailyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('headTextSplit'),
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: const SingleChildScrollView(
          child: MenuComponent(),
        ),
      ),
      body: const SafeArea(bottom: false, child: DailyReportView()),
    );
  }
}

class DailyReportView extends StatefulWidget {
  const DailyReportView({super.key});

  @override
  State<DailyReportView> createState() => _DailyReportViewState();
}

class _DailyReportViewState extends State<DailyReportView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DailyReportController>(context);

    TextStyle headStyle =
        FontConstant.inter.copyWith(fontWeight: FontWeight.bold);
    TextStyle cellStyle = FontConstant.inter.copyWith(fontSize: 12);
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.03),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: const BoxDecoration(color: ColorConstant.headColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DailyReport',
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
                        borderRadius: BorderRadius.circular(6)),
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
        const SizedBox(height: 15),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownDatePicker(
              inputDecoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              isDropdownHideUnderline: true, // optional
              isFormValidator: true, // optional
              startYear: 1900, // optional
              endYear: 2055, // optional
              width: 10, // optional
              showDay: false,
              locale: AppData().getLanguageCode(), // optional
              selectedMonth: controller.selectedMonth, // optional
              selectedYear: controller.selectedYear, // optional
              onChangedMonth: (value) {
                if (value != null) {
                  setState(() {
                    controller.selectedMonth = int.parse(value);
                    controller.getDailyEntry(
                        controller.selectedMonth, controller.selectedYear);
                  });
                }
              },
              onChangedYear: (value) {
                if (value != null) {
                  setState(() {
                    controller.selectedYear = int.parse(value);
                    controller.getDailyEntry(
                        controller.selectedMonth, controller.selectedYear);
                  });
                }
              },
            )),
        // data section.

        controller.dailyReportData.isEmpty
            ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.sizeOf(context).height * 0.3),
                child: Text('noDataMSG', style: FontConstant.inter),
              )
            : Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.03),
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
                    DataColumn(label: Text('Date', style: headStyle)),
                  ],
                  rows:
                      List.generate(controller.dailyReportData.length, (index) {
                    var data = controller.dailyReportData[index];
                    final no = index + 1;

                    final date = data.dateTday;
                    action() {
                      controller.toDetails(data.id.toString(), context);
                    }

                    return DataRow(
                        color: MaterialStateColor.resolveWith((states) {
                          return index % 2 == 0
                              ? ColorConstant.headColor
                              : ColorConstant.dataCellColor1; //make tha magic!
                        }),
                        cells: [
                          DataCell(Text(no.toString(), style: cellStyle),
                              onTap: () {
                            action();
                          }),
                          DataCell(
                              Text(
                                  '${Utils().convertDateTimeDisplay(date.toString())} ${Utils().convertDateTimeDisplayWithDay(date.toString())}',
                                  style: cellStyle), onTap: () {
                            action();
                          }),
                        ]);
                  }),
                ),
              )
      ],
    );
  }
}
