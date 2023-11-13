import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/login_controller.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: ColorConstant.primaryColor,
        title: Text(
          'Ecumenical gospel\nmission of india'.toUpperCase(),
          textAlign: TextAlign.center,
          style: FontConstant.inter.copyWith(
              color: ColorConstant.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    var height = MediaQuery.sizeOf(context).height;

    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8.00),
                Center(
                    child: Image.asset(
                  AssetsConstant.logo,
                  scale: 9,
                )),
                keyboardVisible
                    ? const SizedBox()
                    : SizedBox(height: height * 0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: FontConstant.inter
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Form(
                  key: controller.loginFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: controller.loginContactController,
                        autocorrect: false,
                        validator: Utils.validateEmpty,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorConstant.textColor, width: 0.7),
                              borderRadius: BorderRadius.circular(08),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorConstant.primaryColor,
                                  width: 0.7),
                              borderRadius: BorderRadius.circular(08),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorConstant.textColor,
                                    width: 0.7)),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 0.7),
                              borderRadius: BorderRadius.circular(08),
                            ),
                            label: Text(
                              'User_Name',
                              style: FontConstant.inter.copyWith(fontSize: 14),
                            )),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: controller.loginPasswordController,
                        obscuringCharacter: '*',
                        obscureText: true,
                        autocorrect: false,
                        validator: Utils.validateEmpty,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorConstant.textColor, width: 0.7),
                              borderRadius: BorderRadius.circular(08),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorConstant.primaryColor,
                                  width: 0.7),
                              borderRadius: BorderRadius.circular(08),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorConstant.textColor,
                                    width: 0.7)),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 0.7),
                              borderRadius: BorderRadius.circular(08),
                            ),
                            label: Text(
                              'Password',
                              style: FontConstant.inter.copyWith(fontSize: 14),
                            )),
                      ),
                      Consumer<LoginController>(
                        builder: (context, ref, child) {
                          return ref.loginIsSubmitting
                              ? Container(
                                  margin: const EdgeInsets.only(top: 39),
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(
                                      color: ColorConstant.primaryColor))
                              : InkWell(
                                  onTap: () {
                                    ref.login(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 39),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    width: MediaQuery.sizeOf(context).width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: ColorConstant.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(08)),
                                    child: Text(
                                      'submit'.toUpperCase(),
                                      style: FontConstant.inter.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: ColorConstant.whiteColor),
                                    ),
                                  ),
                                );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
