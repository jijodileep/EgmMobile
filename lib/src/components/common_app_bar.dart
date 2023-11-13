import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/constant.dart';

/// The `commonAppBar` function returns an AppBar widget with a specified title and styling.
///
/// Args:
///   title (String): The title parameter is a string that represents the title of the AppBar. It will
/// be displayed at the center of the AppBar.
///
/// Returns:
///   an AppBar widget.
commonAppBar(String title) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: ColorConstant.whiteColor, // You can use this as well
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ColorConstant.whiteColor,
    ),
    backgroundColor: ColorConstant.primaryColor,
    centerTitle: true,
    title: Text(
      title.toUpperCase(),
      textAlign: TextAlign.center,
      style: FontConstant.inter.copyWith(
          fontWeight: FontWeight.bold,
          color: ColorConstant.whiteColor,
          fontSize: 16),
    ),
  );
}
