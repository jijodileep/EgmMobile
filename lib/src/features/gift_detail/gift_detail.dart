/// The GiftDetail class is a StatelessWidget that displays a Scaffold with an AppBar and a
/// GiftDetailDetailView as the body, which is a watchable widget that listens to changes in the
/// GiftDetailController and displays the gift details accordingly.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/gift_detail_controller.dart';
import '../../utils/utils.dart';

/// The GiftDetail class is a StatelessWidget that displays a Scaffold with an AppBar and a
/// GiftDetailDetailView as the body.
class GiftDetail extends StatelessWidget {
  const GiftDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('GiftDetails'),
      ),
      body: const GiftDetailDetailView(),
    );
  }
}

class GiftDetailDetailView extends StatelessWidget {
  const GiftDetailDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GiftDetailController>(
      builder: (context, ref, child) {
        return ref.loader
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorConstant.primaryColor,
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 20.00, horizontal: 16.00),
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        Utils().convertDateTimeDisplay(
                            ref.giftData.data!.data!.dateTday.toString()),
                        style: FontConstant.inter.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    const SizedBox(height: 16.00),
                    const SizedBox(height: 16.00),
                    Table(
                      border: TableBorder.all(width: 1, color: Colors.black45),
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Name",
                              style: FontConstant.inter
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "markRemark",
                              style: FontConstant.inter
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Date",
                              style: FontConstant.inter
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "DistributionStatus",
                              style: FontConstant.inter
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ))
                        ])
                      ],
                    ),
                    ListView.builder(
                      itemCount: ref.giftDetails.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var data = ref.giftDetails[index];
                        return Table(
                          border:
                              TableBorder.all(width: 1, color: Colors.black45),
                          children: [
                            TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  data.familyMember!.name!,
                                  style: FontConstant.inter,
                                ),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  data.description.toString(),
                                  style: FontConstant.inter,
                                ),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  Utils().convertDateTimeDisplay(
                                      data.updatedDate.toString()),
                                  style: FontConstant.inter,
                                ),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: data.description == 'False' ||
                                        data.description == 'false'
                                    ? Text(
                                        'NotCompleted',
                                        style: FontConstant.inter,
                                      )
                                    : Text(
                                        'Completed',
                                        style: FontConstant.inter.copyWith(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ))
                            ])
                          ],
                        );
                      },
                    ),
                  ],
                ));
      },
    );
  }
}
