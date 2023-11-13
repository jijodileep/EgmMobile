import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/announcement_controller.dart';
import '../../utils/utils.dart';

class Announcement extends StatelessWidget {
  const Announcement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('Announcement'),
      body: const SafeArea(bottom: false, child: AnnouncementView()),
    );
  }
}

class AnnouncementView extends StatelessWidget {
  const AnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AnnouncementController>(context);
    return Consumer<AnnouncementController>(
      builder: (context, ref, child) {
        return controller.screenLoader
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorConstant.primaryColor,
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.00, vertical: 20.00),
                child: controller.prayerRequest.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.prayerRequest.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          var data = controller.prayerRequest[index];
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${'Title'} - ',
                                    style: FontConstant.inter
                                        .copyWith(fontWeight: FontWeight.w900),
                                  ),
                                  Flexible(
                                    child: Text(
                                      data.name!,
                                      style: FontConstant.inter.copyWith(
                                          fontWeight: FontWeight.w600),
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
                                      data.description!,
                                      style: FontConstant.inter.copyWith(
                                          fontWeight: FontWeight.w600),
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
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10.00),
                                  ),
                                  Flexible(
                                    child: Text(
                                      Utils().convertDateTimeDisplay(
                                          data.createdDate.toString()),
                                      style: FontConstant.inter.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10.00),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.00),
                              const Divider(),
                              const SizedBox(height: 20.00),
                            ],
                          );
                        },
                      )
                    : Container(),
              );
      },
    );
  }
}
