import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'src/app/my_app.dart';
import 'src/constant/constant.dart';
import 'src/data/app_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Specifies the set of orientations the application interface can be displayed in.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: ColorConstant.whiteColor, // You can use this as well
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: ColorConstant.whiteColor,
        systemNavigationBarIconBrightness: Brightness.dark),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

  await GetStorage.init();
  String userId = AppData().getUserID();
  bool isUserLoggedIn = userId.isNotEmpty;

// Application root project: flutter run
  runApp(MyApp(
    isUserLoggedIn: isUserLoggedIn,
  ));
}
