import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/common_app_bar.dart';
import '../../components/menu_component.dart';
import '../../constant/constant.dart';
import '../../provider/communication_controller.dart';

class Communication extends StatelessWidget {
  const Communication({super.key});

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
      body: const SafeArea(bottom: false, child: CommunicationView()),
    );
  }
}

class CommunicationView extends StatelessWidget {
  const CommunicationView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<CommunicationController>(context, listen: false);
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20.00, horizontal: 16.00),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: 30,
        runSpacing: 30,
        children: [
          InkWell(
            onTap: () {
              controller.toAdminPrayer(context);
            },
            child: Container(
              height: 140,
              width: 140,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(20, 66, 114, 1.0),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'PrayerRequest',
                textAlign: TextAlign.center,
                style: FontConstant.inter.copyWith(
                    color: ColorConstant.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.toAnnouncement(context);
            },
            child: Container(
              height: 140,
              width: 140,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(20, 66, 114, 1.0),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'Announcement',
                textAlign: TextAlign.center,
                style: FontConstant.inter.copyWith(
                    color: ColorConstant.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.toPrayer(context);
            },
            child: Container(
              height: 140,
              width: 140,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(20, 66, 114, 1.0),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'OfficeCommunications',
                textAlign: TextAlign.center,
                style: FontConstant.inter.copyWith(
                    color: ColorConstant.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
