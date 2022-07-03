// ignore_for_file: deprecated_member_use, file_names

import 'package:arzan/components/constants/constants.dart';
import 'package:arzan/controllers/SettingsController.dart';
import 'package:arzan/views/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class Page5 extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());

  Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25, left: 10, right: 10),
                    child: Text(
                      "Boldy gosuldy cykay".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: normsProMedium,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Get.to(() => const BottomNavBar());
                    },
                    shape: const RoundedRectangleBorder(borderRadius: borderRadius10),
                    color: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "agree".tr,
                          style: const TextStyle(color: Colors.white, fontSize: 22, fontFamily: normsProMedium, fontWeight: FontWeight.w600),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(IconlyLight.arrowRightCircle, color: Colors.white, size: 24),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
