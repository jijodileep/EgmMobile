import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/constant.dart';
import '../../provider/distribution_controller.dart';

class Distribution extends StatelessWidget {
  const Distribution({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('Distribution'),
      ),
      body: const AddGiftView(),
    );
  }
}

class AddGiftView extends StatefulWidget {
  const AddGiftView({super.key});

  @override
  State<AddGiftView> createState() => _AddGiftViewState();
}

class _AddGiftViewState extends State<AddGiftView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DistributionController>(
      builder: (context, ref, child) {
        return ref.loader
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorConstant.primaryColor,
                ),
              )
            : Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: ListView(
                  children: [
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
                        return Table(
                          border:
                              TableBorder.all(width: 1, color: Colors.black45),
                          children: [
                            TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  ref.customCheckList[index].userName!,
                                  style: FontConstant.inter,
                                ),
                              )),
                              TableCell(
                                  child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Checkbox(
                                          value:
                                              ref.customCheckList[index].status,
                                          onChanged: (v) {
                                            setState(() {
                                              ref.customCheckList[index]
                                                  .status = v;
                                            });
                                          })))
                            ])
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 16.00),
                    GestureDetector(
                      onTap: () {
                        ref.distribution();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'update',
                            style: FontConstant.inter.copyWith(
                                color: ColorConstant.whiteColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
