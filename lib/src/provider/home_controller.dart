import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../model/login_model.dart';
import '../services/authentication_service.dart';
import '../utils/utils.dart';

class HomeController extends ChangeNotifier {
  var homeLoader = true;
  var loginModel = LoginModel();

  startHome() async {
    var loginUser = AppData().getLoginUser();
    var password = AppData().getPassword();
    homeLoader = true;
    var httpResponse =
        await AuthenticationService().login(loginUser, 'string', password);
    if (!httpResponse.hasError) {
      loginModel = LoginModel.fromMap(httpResponse.response!.data);
      homeLoader = false;
    } else {
      homeLoader = true;
      Utils().showToast('something_error');
    }

    notifyListeners();
  }
}

PayData payDataFromMap(String str) => PayData.fromMap(json.decode(str));

String payDataToMap(PayData data) => json.encode(data.toMap());

class PayData {
  String? data;

  PayData({
    this.data,
  });

  factory PayData.fromMap(Map<String, dynamic> json) => PayData(
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "data": data,
      };
}
