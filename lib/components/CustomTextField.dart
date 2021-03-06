// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelName;
  final int? maxline;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode requestfocusNode;
  final bool isNumber;
  final bool? borderRadius;

  const CustomTextField({
    Key? key,
    required this.labelName,
    this.maxline,
    this.borderRadius,
    required this.controller,
    required this.focusNode,
    required this.requestfocusNode,
    required this.isNumber,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(
        style: const TextStyle(color: Colors.black, fontFamily: normsProMedium),
        cursorColor: Colors.black,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "errorEmpty".tr;
          }
          return null;
        },
        onEditingComplete: () {
          requestfocusNode.requestFocus();
        },
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxline ?? 1,
        focusNode: focusNode,
        decoration: InputDecoration(
          errorMaxLines: 2,
          errorStyle: const TextStyle(fontFamily: normsProMedium),
          labelText: labelName.tr,
          contentPadding: const EdgeInsets.only(left: 25, top: 20, bottom: 20, right: 10),
          labelStyle: TextStyle(color: Colors.grey.shade500, fontFamily: normsProMedium),
          border: OutlineInputBorder(
            borderRadius: borderRadius == null
                ? borderRadius5
                : borderRadius == false
                    ? borderRadius5
                    : borderRadius20,
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius == null
                ? borderRadius5
                : borderRadius == false
                    ? borderRadius5
                    : borderRadius20,
            borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius == null
                ? borderRadius5
                : borderRadius == false
                    ? borderRadius5
                    : borderRadius20,
            borderSide: const BorderSide(color: kPrimaryColor, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius == null
                ? borderRadius5
                : borderRadius == false
                    ? borderRadius5
                    : borderRadius20,
            borderSide: const BorderSide(color: kPrimaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius == null
                ? borderRadius5
                : borderRadius == false
                    ? borderRadius5
                    : borderRadius20,
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
        ),
      ),
    );
  }
}
