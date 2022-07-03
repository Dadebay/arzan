// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arzan/components/CustomTextField.dart';
import 'package:arzan/components/PhoneNumber.dart';
import 'package:arzan/components/buttons/agreeButton.dart';
import 'package:arzan/components/constants/constants.dart';

import 'ForgotPassword.dart';

class Login extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  FocusNode fullNameFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode phoneNumberFocusNode = FocusNode();
  final login = GlobalKey<FormState>();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: login,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PhoneNumber(
              mineFocus: phoneNumberFocusNode,
              controller: phoneNumberController,
              requestFocus: emailFocusNode,
              style: false,
            ),
            CustomTextField(labelName: "password", controller: passwordController, focusNode: passwordFocusNode, requestfocusNode: fullNameFocusNode, borderRadius: true, isNumber: false),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AgreeButton(onTap: () {
                  if (login.currentState!.validate()) {
                  } else {}
                }),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgotPassword());
                  },
                  child: Text(
                    "forgotPassword".tr,
                    style: const TextStyle(color: Colors.black, decoration: TextDecoration.underline, decorationColor: Colors.black, fontFamily: normsProSemiBold, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 65),
            const SizedBox(height: 65),
          ],
        ),
      ),
    );
  }
}
