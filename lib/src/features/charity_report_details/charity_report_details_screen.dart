import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../model/charity_details_model.dart';
import '../../provider/charity_report_details_controller.dart';
import '../../utils/utils.dart';

class CharityReportDetailScreen extends StatelessWidget {
  const CharityReportDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('headTextSplit'),
      body: const SafeArea(bottom: false, child: YearReportDetail()),
    );
  }
}

class YearReportDetail extends StatefulWidget {
  const YearReportDetail({super.key});

  @override
  State<YearReportDetail> createState() => _YearReportDetailState();
}

class _YearReportDetailState extends State<YearReportDetail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CharityReportDetailsController>(
      builder: (context, ref, child) {
        return ref.reportLoader
            ? const Center(
                child: CircularProgressIndicator(
                    color: ColorConstant.primaryColor),
              )
            : ref.yearData.data!.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15.00, vertical: 15.00),
                    child: ListView(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 19.00),
                          child: Text(
                            Utils().convertDateTimeDisplay(
                                ref.yearData.data!.first.dateTday.toString()),
                            style: FontConstant.inter
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const DataTableSection(),
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                      'noDataMSG',
                      style: FontConstant.inter,
                    ),
                  );
      },
    );
  }
}

class DataTableSection extends StatefulWidget {
  const DataTableSection({super.key});

  @override
  State<DataTableSection> createState() => _DataTableSectionState();
}

class _DataTableSectionState extends State<DataTableSection> {
  late Datum data;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var controller =
          Provider.of<CharityReportDetailsController>(context, listen: false);
      data = controller.yearData.data!.first;
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('data', data));
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      textDirection: TextDirection.ltr,
      border: const TableBorder(
          left: BorderSide(color: Colors.blue, width: 1),
          right: BorderSide(color: Colors.blue, width: 1),
          top: BorderSide(color: Colors.blue, width: 1),
          bottom: BorderSide(color: Colors.blue, width: 1),
          horizontalInside: BorderSide(
            width: 1,
            color: ColorConstant.primaryColor,
          )),
      defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
      children: [
        TableRow(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.00).copyWith(left: 6.00),
            child: Text(
              'charityRemark',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.00),
            child: Text(
              data.remarks ?? '',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.00)
                .copyWith(left: 06.00),
            child: Text(
              'educationAid',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.00),
            child: Text(
              data.educationAid.toString(),
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.00)
                .copyWith(left: 06.00),
            child: Text(
              'EducationKitsDistribution',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.00),
            child: Text(
              data.educationKits.toString(),
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.00).copyWith(left: 6.00),
            child: Text(
              'marriageAid',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00),
            child: Text(
              data.marriageAid.toString(),
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00)
                .copyWith(left: 06.00),
            child: Text(
              'widowAid',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00),
            child: Text(
              data.widowAid.toString(),
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00)
                .copyWith(left: 06.00),
            child: Text(
              'AidDifferently-abled',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00),
            child: Text(
              data.aidrDifferentlyAbled.toString(),
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00)
                .copyWith(left: 06.00),
            child: Text(
              'medicalAid',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00),
            child: Text(
              data.medicalAid.toString(),
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00)
                .copyWith(left: 06.00),
            child: Text(
              'houseConstructionAid',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00),
            child: Text(
              data.houseConstructionAid.toString(),
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00)
                .copyWith(left: 06.00),
            child: Text(
              'otherAid',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00),
            child: Text(
              data.otherAid.toString(),
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00)
                .copyWith(left: 06.00),
            child: Text(
              'TotalReceipts',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00),
            child: Text(
              data.cottageTotalReceiptsExpenses.toString(),
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00)
                .copyWith(left: 06.00),
            child: Text(
              'TotalPayments',
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 08.00),
            child: Text(
              data.cottagePrayerRequests.toString(),
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
      ],
    );
  }
}

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<CharityReportDetailsController>(context, listen: false);
    return Container(
        margin: const EdgeInsets.only(top: 15.00),
        child: controller.yearData.memdetails!.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.yearData.memdetails!.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = controller.yearData.memdetails![index];
                  return ListTile(
                    leading: Text(
                      data.type.toString(),
                      style: FontConstant.inter
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      data.familyMember!.name!,
                      style: FontConstant.inter.copyWith(fontSize: 12),
                    ),
                  );
                },
              )
            : Container());
  }
}
