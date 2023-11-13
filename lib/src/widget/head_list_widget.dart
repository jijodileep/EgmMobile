import 'package:flutter/material.dart';

import '../constant/font_constant.dart';

class HeadListWidget extends StatelessWidget {
  const HeadListWidget({
    Key? key,
    required this.value,
    required this.leadValue,
  }) : super(key: key);
  final String leadValue, value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: '$leadValue' ': ',
          style: FontConstant.inter.copyWith(fontWeight: FontWeight.w900)),
      TextSpan(
          text: value,
          style: FontConstant.inter.copyWith(fontWeight: FontWeight.w400))
    ]));
  }
}
