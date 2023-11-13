import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/prayer_details_controller.dart';
import '../../utils/utils.dart';

class PrayerDetail extends StatelessWidget {
  const PrayerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PrayerDetailsController>(context);
    return Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        appBar: commonAppBar('OfficeCommunicationsDetails'),
        body: const SafeArea(bottom: false, child: PrayerDetailView()),
        floatingActionButton: Consumer<PrayerDetailsController>(
          builder: (context, ref, child) {
            return ref.screenLoad
                ? const SizedBox()
                : GestureDetector(
                    onTap: () {
                      controller.toComment(controller.data.id);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.00),
                      decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.add,
                            color: ColorConstant.whiteColor,
                          ),
                          Text(
                            'addNewComment',
                            style: FontConstant.inter.copyWith(
                                color: ColorConstant.whiteColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}

class PrayerDetailView extends StatefulWidget {
  const PrayerDetailView({super.key});

  @override
  State<PrayerDetailView> createState() => _PrayerDetailViewState();
}

class _PrayerDetailViewState extends State<PrayerDetailView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerDetailsController>(
      builder: (context, ref, child) {
        return ref.screenLoad
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorConstant.primaryColor,
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.00, vertical: 20.00),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${'Name'} - ',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        Flexible(
                          child: Text(
                            ref.data.name!,
                            style: FontConstant.inter
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${'description'} - ',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        Flexible(
                          child: Text(
                            ref.data.description!,
                            style: FontConstant.inter
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.00),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${'createdDate'} - ',
                          style: FontConstant.inter.copyWith(
                              fontWeight: FontWeight.w300, fontSize: 10),
                        ),
                        Flexible(
                          child: Text(
                            Utils().convertDateTimeDisplay(
                                ref.data.createdDate.toString()),
                            style: FontConstant.inter.copyWith(
                                fontWeight: FontWeight.w300, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.00),
                    const Divider(thickness: 1),
                    Text(
                      'relatedComments',
                      style: FontConstant.inter
                          .copyWith(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                    ref.comment.isEmpty
                        ? Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20.00),
                            child: const Text('noDataMSG'),
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 20.00),
                            child: ListView.builder(
                              itemCount: ref.comment.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var comment = ref.comment[index];
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${'Name'} - ',
                                          style: FontConstant.inter.copyWith(
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Flexible(
                                          child: Text(
                                            comment.missionaries!.name!,
                                            style: FontConstant.inter.copyWith(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${'description'} - ',
                                          style: FontConstant.inter.copyWith(
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Flexible(
                                          child: Text(
                                            comment.description!,
                                            style: FontConstant.inter.copyWith(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5.00),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${'createdDate'} - ',
                                          style: FontConstant.inter.copyWith(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        Flexible(
                                          child: Text(
                                            Utils().convertDateTimeDisplay(
                                                comment.createdDate.toString()),
                                            style: FontConstant.inter.copyWith(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20.00),
                                    const Divider(thickness: 1),
                                  ],
                                );
                              },
                            ),
                          ),
                  ],
                ),
              );
      },
    );
  }
}
