// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arzan/components/CustomTextField.dart';
import 'package:arzan/components/PhoneNumber.dart';
import 'package:arzan/components/appBar.dart';

import '../../../components/constants/constants.dart';
import 'ChangePassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController phoneNumberController = TextEditingController();

  FocusNode phoneFocusNode = FocusNode();

  TextEditingController otpController = TextEditingController();

  FocusNode otpFocusNode = FocusNode();

  bool numberSendLoading = false;

  bool otpHide = false;

  final _forgot = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const MyAppBar(
        backArrow: true,
        iconRemove: true,
        name: "forgotPassword1",
        elevation: 1,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                numberSendLoading ? "Please enter the otp sms code" : "phoneText".tr,
                style: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: normsProMedium),
              ),
            ),
            AnimatedCrossFade(
                firstChild: CustomTextField(labelName: "otp", controller: otpController, focusNode: otpFocusNode, requestfocusNode: phoneFocusNode, borderRadius: true, isNumber: true),
                secondChild: Form(key: _forgot, child: PhoneNumber(mineFocus: phoneFocusNode, controller: phoneNumberController, requestFocus: otpFocusNode)),
                firstCurve: Curves.easeInCubic,
                secondCurve: Curves.fastOutSlowIn,
                crossFadeState: otpHide ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 400)),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (numberSendLoading == true) {
                    Get.to(() => ChangePasswordPage());
                  }
                  numberSendLoading = !numberSendLoading;
                  otpHide = !otpHide;
                });
              },
              child: Center(
                child: AnimatedContainer(
                  margin: const EdgeInsets.only(top: 15),
                  width: numberSendLoading ? 70 : Get.size.width,
                  decoration: const BoxDecoration(color: kPrimaryColor, borderRadius: borderRadius20),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  duration: const Duration(milliseconds: 800),
                  alignment: Alignment.center,
                  curve: Curves.decelerate,
                  child: numberSendLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text("send".tr, maxLines: 1, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 22, fontFamily: normsProSemiBold)),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
