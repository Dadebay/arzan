// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:arzan/components/CustomTextField.dart';
import 'package:arzan/components/appBar.dart';
import 'package:arzan/components/buttons/agreeButton.dart';
import 'package:arzan/components/constants/constants.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  FocusNode newPasswordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: const MyAppBar(backArrow: true, elevation: 1, iconRemove: false, name: "newPassword"),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Wrap(
            children: [
              CustomTextField(labelName: "newPassword", controller: newPassword, borderRadius: true, focusNode: newPasswordFocusNode, requestfocusNode: confirmPasswordFocusNode, isNumber: false),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(labelName: "confirmPassword", controller: confirmPassword, borderRadius: true, focusNode: confirmPasswordFocusNode, requestfocusNode: newPasswordFocusNode, isNumber: false),
              ),
              AgreeButton(onTap: () async {
                // await Restart.restartApp();
              })
            ],
          ),
        ));
  }
}
