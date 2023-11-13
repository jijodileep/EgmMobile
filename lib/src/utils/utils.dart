import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../constant/constant.dart';

class Utils {
  static String? validateEmpty(String? v) {
    if (v!.isEmpty) {
      return 'field_cant_be_empty';
    } else {
      return null;
    }
  }

  static String? validateTEmpty<T>(T? v) {
    if (v == null) {
      return 'field_cant_be_empty';
    } else {
      return null;
    }
  }

  static String? validatePhone(String? v) {
    if (v!.isEmpty) {
      return 'field_cant_be_empty';
    } else if (v.length != 10) {
      return 'please_enter_a_valid_mobile_number';
    } else {
      return null;
    }
  }

  static void unFocus() {}

  static hideKeyboard() {}

  showToast(String msg,
      {Toast? length, backgroundColor, textColor, double? fontSize}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: length ?? Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor ?? ColorConstant.blackColor,
        textColor: textColor ?? ColorConstant.whiteColor,
        fontSize: fontSize ?? 14);
  }

  cancelToast() {
    return Fluttertoast.cancel();
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  String convertDateTimeDisplayWithDay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('EEE');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  String convertDateTimeAPI(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  // String convertTimeDisplay(String date) {
  //   final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  //   final DateFormat serverFormater = DateFormat('HH:mm:ss');
  //   final DateTime displayDate = displayFormater.parse(date);
  //   final String formatted = serverFormater.format(displayDate);
  //   return formatted;
  // }

  removeSqr(String value) {
    String a = value.replaceAll("[", "");
    return a.replaceAll("]", "");
  }

  static void showLoading([String? message]) {
    Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: ColorConstant.primaryColor,
            ),
            const SizedBox(height: 8),
            Text(message ?? 'Loading'),
          ],
        ),
      ),
    );
  }
}
