import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/other_gift_controller.dart';
import '../../utils/utils.dart';

class OtherGift extends StatelessWidget {
  const OtherGift({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('OtherGifts'),
      body: const SafeArea(child: GiftView()),
    );
  }
}

class GiftView extends StatefulWidget {
  const GiftView({super.key});

  @override
  State<GiftView> createState() => _GiftViewState();
}

class _GiftViewState extends State<GiftView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtherGiftController>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.00, vertical: 20.00),
      child: ListView(
        children: [
//  /// Add new
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  provider.toAddGift(context);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.00),
                    height: 35.00,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(08)),
                    child: Text(
                      'Register',
                      style: FontConstant.inter.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: ColorConstant.whiteColor),
                    )),
              ),
            ],
          ),

          Consumer<OtherGiftController>(
            builder: (context, ref, child) {
              TextStyle headStyle =
                  FontConstant.inter.copyWith(fontWeight: FontWeight.bold);
              TextStyle cellStyle = FontConstant.inter.copyWith(fontSize: 12);
              return provider.loader
                  ? Container(
                      margin: const EdgeInsets.only(top: 30.00),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                          color: ColorConstant.primaryColor),
                    )
                  : Container(
                      margin: const EdgeInsets.only(top: 30.00),
                      child: ref.giftData.isEmpty
                          ? Center(
                              child:
                                  Text('noDataMSG', style: FontConstant.inter))
                          : ref.giftData.isNotEmpty
                              ? DataTable(
                                  showBottomBorder: false,
                                  columnSpacing:
                                      MediaQuery.sizeOf(context).width * 0.022,
                                  headingRowColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          ColorConstant.dataCellColor1),
                                  border: const TableBorder(
                                      horizontalInside: BorderSide(
                                          width: 3,
                                          color: ColorConstant.whiteColor,
                                          style: BorderStyle.solid)),
                                  columns: [
                                    DataColumn(
                                        label: Text('No', style: headStyle)),
                                    DataColumn(
                                        label:
                                            Text('GiftType', style: headStyle)),
                                    DataColumn(
                                        label: Text('Date', style: headStyle)),
                                  ],
                                  rows: List.generate(ref.giftData.length,
                                      (index) {
                                    var data = ref.giftData[index];
                                    final no = index + 1;
                                    final name = data.giftType?.name;
                                    final phone = data.dateTday;
                                    return DataRow(cells: [
                                      DataCell(
                                          Text(no.toString(), style: cellStyle),
                                          onTap: () {
                                        ref.toDetail(
                                            ref.giftData[index].id.toString());
                                      }),
                                      DataCell(
                                          Text(name.toString(),
                                              style: cellStyle), onTap: () {
                                        ref.toDetail(
                                            ref.giftData[index].id.toString());
                                      }),
                                      DataCell(
                                          Text(
                                              Utils().convertDateTimeDisplay(
                                                  phone.toString()),
                                              style: cellStyle), onTap: () {
                                        ref.toDetail(
                                            ref.giftData[index].id.toString());
                                      }),
                                    ]);
                                  }),
                                )
                              : const SizedBox());
            },
          )
        ],
      ),
    );
  }
}
