import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/gift_register_detail_controller.dart';
import '../../utils/utils.dart';

class GiftRegisterDetail extends StatelessWidget {
  const GiftRegisterDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('GiftDetails'),
      ),
      body: const DetailView(),
    );
  }
}

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GiftRegisterDetailController>(context);

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20.00, horizontal: 16.00),
        child: ListView(
          children: [
            Center(
              child: Text(
                Utils().convertDateTimeDisplay(
                    controller.giftData.data!.data!.dateTday.toString()),
                style: FontConstant.inter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            const SizedBox(height: 16.00),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.toDistribution(context);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Distribution',
                        style: FontConstant.inter.copyWith(
                            color: ColorConstant.whiteColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                InkWell(
                  onTap: () {
                    controller.toEdit(context);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Add/Remove',
                        style: FontConstant.inter.copyWith(
                            color: ColorConstant.whiteColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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

            ///  In this case, it is used to display a list of gift details.
            ListView.builder(
              itemCount: controller.giftDetails.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var data = controller.giftDetails[index];
                return Table(
                  border: TableBorder.all(width: 1, color: Colors.black45),
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
                          Utils().convertDateTimeDisplay(
                              data.createdDate.toString()),
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
  }
}
