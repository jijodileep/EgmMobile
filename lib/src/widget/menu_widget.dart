import 'package:flutter/material.dart';

import '../constant/constant.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget(
      {Key? key, required this.name, required this.icon, required this.action})
      : super(key: key);

  final String icon, name;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          action();
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: 10),
          child: Row(children: [
            Image.asset(
              icon,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 12),
            Text(
              name,
              style: FontConstant.inter.copyWith(fontWeight: FontWeight.w500),
            )
          ]),
        ));
  }
}
