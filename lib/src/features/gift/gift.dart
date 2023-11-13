import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../components/menu_component.dart';
import '../../constant/constant.dart';
import '../../provider/gift_controller.dart';

class Gift extends StatelessWidget {
  const Gift({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('headTextSplit'),
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: const SingleChildScrollView(
          child: MenuComponent(),
        ),
      ),
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
    final controller = Provider.of<GiftController>(context, listen: false);
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
              controller.toEducation(context);
            },
            child: Container(
              height: 140,
              width: 140,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(20, 66, 114, 1.0),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'EducationalKit',
                textAlign: TextAlign.center,
                style: FontConstant.inter.copyWith(
                    color: ColorConstant.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.toOther(context);
            },
            child: Container(
              height: 140,
              width: 140,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(20, 66, 114, 1.0),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'OtherGifts',
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
