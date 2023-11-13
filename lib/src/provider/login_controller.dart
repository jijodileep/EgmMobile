import 'package:egm_developer_mode/src/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../model/login_model.dart';
import '../services/authentication_service.dart';
import '../utils/utils.dart';

class LoginController extends ChangeNotifier {
  var loginIsSubmitting = false;
  final loginContactController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  var loginModel = LoginModel();

  login(context) async {
    Utils.hideKeyboard();
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState?.save();
      loginIsSubmitting = true;
      var httpResponse = await AuthenticationService().login(
          loginContactController.text.trim(),
          'string',
          loginPasswordController.text.trim());
      if (!httpResponse.hasError) {
        loginModel = LoginModel.fromMap(httpResponse.response!.data);
        var data = loginModel.data;
        if (data == null) {
          var message = loginModel.message;
          loginIsSubmitting = false;
          Utils().cancelToast();
          Utils().showToast(message.toString());
        } else {
          loginIsSubmitting = false;
          var name = data.loguser!.name;
          AppData().storeUserName(name.toString());
          AppData().storeUserEmail(data.loguser!.emailAddress.toString());
          AppData().storeUserPhone(data.loguser!.phoneNumber.toString());
          AppData().storeUserAddress(data.loguser!.address.toString());
          AppData().storeUserCategoryId(data.loguser!.categoryId.toString());
          AppData().storeUserID(data.loguser!.id.toString());
          AppData().storePassword(loginPasswordController.text.trim());
          AppData().storeLoginUser(loginContactController.text.trim());
          AppData().storeStateId(data.loguser!.stateId.toString());
          AppData().storeDistrictId(data.loguser!.districtId.toString());
          AppData().storeDTalukId(data.loguser!.talukId.toString());
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomeScreen(),
            ),
          );
          notifyListeners();
        }
      } else {
        Utils().cancelToast();
        loginIsSubmitting = false;
        Utils().showToast('something_error');
        notifyListeners();
      }
    } else {
      Utils().cancelToast();
      loginIsSubmitting = false;
      Utils().showToast('Please_check_your_details');
      notifyListeners();
    }
  }
}
