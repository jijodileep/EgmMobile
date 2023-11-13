import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/common_app_bar.dart';
import '../../components/menu_component.dart';
import '../../constant/constant.dart';
import '../../provider/charity_report_controller.dart';
import '../../utils/utils.dart';

class CharityReportScreen extends StatelessWidget {
  const CharityReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('headTextSplit'),
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: const SingleChildScrollView(
          child: MenuComponent(),
        ),
      ),
      body: const SafeArea(bottom: false, child: YearReportView()),
    );
  }
}

class YearReportView extends StatelessWidget {
  const YearReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CharityReportController>(context);
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.03),
          padding:
              const EdgeInsets.symmetric(vertical: 15.00, horizontal: 15.00),
          decoration: const BoxDecoration(color: ColorConstant.headColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CharityReport',
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
        Consumer(
          builder: (context, ref, child) {
            TextStyle headStyle =
                FontConstant.inter.copyWith(fontWeight: FontWeight.bold);
            TextStyle cellStyle = FontConstant.inter.copyWith(fontSize: 12.00);
            return controller.yearLoader
                ? const Center(
                    child: CircularProgressIndicator(
                        color: ColorConstant.primaryColor),
                  )
                : controller.year.isEmpty
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
                              DataColumn(
                                  label: Text('Action', style: headStyle)),
                            ],
                            rows:
                                List.generate(controller.year.length, (index) {
                              var data = controller.year[index];
                              final no = index + 1;
                              final date = data.dateTday;
                              action() {
                                controller.toReportDetails(data.id, context);
                              }

                              return DataRow(
                                  color:
                                      MaterialStateColor.resolveWith((states) {
                                    return index % 2 == 0
                                        ? ColorConstant.headColor
                                        : ColorConstant
                                            .dataCellColor1; //make tha magic!
                                  }),
                                  cells: [
                                    DataCell(
                                        Text(no.toString(), style: cellStyle),
                                        onTap: () {
                                      action();
                                    }),
                                    DataCell(
                                        Text(
                                            Utils().convertDateTimeDisplay(
                                                date.toString()),
                                            style: cellStyle), onTap: () {
                                      action();
                                    }),
                                    DataCell(Text('View', style: cellStyle),
                                        onTap: () {
                                      action();
                                    }),
                                  ]);
                            })),
                      );
          },
        ),
      ],
    );
  }
}
