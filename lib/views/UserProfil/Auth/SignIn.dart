// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:arzan/components/CustomTextField.dart';
import 'package:arzan/components/PhoneNumber.dart';
import 'package:arzan/components/buttons/agreeButton.dart';

class SingIn extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  FocusNode fullNameFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode phoneNumberFocusNode = FocusNode();
  final _signUp = GlobalKey<FormState>();

  SingIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _signUp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextField(labelName: "fullName", controller: fullNameController, focusNode: fullNameFocusNode, requestfocusNode: phoneNumberFocusNode, borderRadius: true, isNumber: false),
            PhoneNumber(
              mineFocus: phoneNumberFocusNode,
              controller: phoneNumberController,
              requestFocus: emailFocusNode,
            ),
            CustomTextField(labelName: "email", controller: emailController, focusNode: emailFocusNode, requestfocusNode: passwordFocusNode, borderRadius: true, isNumber: false),
            CustomTextField(labelName: "password", controller: passwordController, focusNode: passwordFocusNode, requestfocusNode: fullNameFocusNode, borderRadius: true, isNumber: false),
            AgreeButton(onTap: () {
              if (_signUp.currentState!.validate()) {
              } else {}
            })
          ],
        ),
      ),
    );
  }
}
