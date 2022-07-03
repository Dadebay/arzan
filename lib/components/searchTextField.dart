// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import 'constants/constants.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function() onTap;
  const SearchTextField({Key? key, required this.controller, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black, fontSize: 18, fontFamily: normsProMedium),
      cursorColor: Colors.black,
      controller: controller,
      onTap: onTap,
      validator: (value) {
        if (value!.isEmpty) {
          return "errorEmpty".tr;
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "search".tr,
        contentPadding: const EdgeInsets.only(top: 14, bottom: 14),
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 20, fontFamily: normsProMedium),
        prefixIconConstraints: const BoxConstraints(maxWidth: 150, minWidth: 60),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 6,
          ),
          child: Icon(
            IconlyLight.search,
            color: Colors.grey.shade600,
            size: 30,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: borderRadius15,
          borderSide: BorderSide(color: backgroundColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius20,
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: borderRadius15,
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: borderRadius15,
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: borderRadius15,
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
