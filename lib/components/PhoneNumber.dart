// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'constants/constants.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    required this.mineFocus,
    required this.controller,
    required this.requestFocus,
  });
  final TextEditingController controller;
  final FocusNode mineFocus;
  final FocusNode requestFocus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(
        style: const TextStyle(color: Colors.black, fontSize: 18, fontFamily: normsProMedium),
        cursorColor: Colors.black,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        focusNode: mineFocus,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "errorEmpty".tr;
          } else if (value.length != 8) {
            return "errorPhoneCount".tr;
          }
          return null;
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(8),
        ],
        onEditingComplete: () {
          requestFocus.requestFocus();
        },
        decoration: InputDecoration(
          errorMaxLines: 2,
          errorStyle: const TextStyle(fontFamily: normsProMedium),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 2),
            child: Text(
              '+ 993',
              style: TextStyle(color: Colors.grey, fontSize: 18, fontFamily: normsProMedium),
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
          prefixIconConstraints: const BoxConstraints(minWidth: 80),
          hintText: '65 656565 ',
          alignLabelWithHint: true,
          hintStyle: const TextStyle(color: Colors.grey, fontFamily: normsProMedium),
          border: const OutlineInputBorder(
            borderRadius: borderRadius20,
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius20,
            borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: borderRadius20,
            borderSide: BorderSide(color: kPrimaryColor, width: 2),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: borderRadius20,
            borderSide: BorderSide(color: kPrimaryColor, width: 2),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: borderRadius20,
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
        ),
      ),
    );
  }
}
