import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../components/menu_component.dart';
import '../../constant/constant.dart';
import '../../provider/sunday_controller.dart';
import '../../utils/utils.dart';

class SundayScreen extends StatelessWidget {
  const SundayScreen({super.key});

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
    final provider = Provider.of<SundayController>(context);
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
                'sundayWorship',
                style: FontConstant.inter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  provider.toAddReport(context);
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

        // Table section

        Consumer<SundayController>(
          builder: (context, ref, child) {
            TextStyle headStyle =
                FontConstant.inter.copyWith(fontWeight: FontWeight.bold);
            TextStyle cellStyle = FontConstant.inter.copyWith(fontSize: 12);
            return ref.sundayLoader
                ? const Center(
                    child: CircularProgressIndicator(
                        color: ColorConstant.primaryColor),
                  )
                : ref.sunday.isEmpty
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
                              DataColumn(
                                  label: Text('MeetingName', style: headStyle)),
                              DataColumn(label: Text('Date', style: headStyle)),
                            ],
                            rows: List.generate(ref.sunday.length, (index) {
                              var data = ref.sunday[index];
                              final no = index + 1;
                              final reason = data.reason;
                              final date = data.dateTday;

                              action() {
                                ref.toDetail(context);
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
                                        Text(reason.toString(),
                                            style: cellStyle), onTap: () {
                                      action();
                                    }),
                                    DataCell(
                                        Text(
                                            Utils().convertDateTimeDisplay(
                                                date.toString()),
                                            style: cellStyle), onTap: () {
                                      action();
                                    }),
                                  ]);
                            })),
                      );
          },
        )
      ],
    );
  }
}
