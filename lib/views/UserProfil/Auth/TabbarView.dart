// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:arzan/components/constants/constants.dart';
import 'package:lottie/lottie.dart';

import 'Login.dart';
import 'SignIn.dart';

class TabBarViewPage extends StatelessWidget {
  const TabBarViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            SizedBox(
              width: Get.size.width,
              height: Get.size.height / 2,
              child: Center(
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: const BoxDecoration(borderRadius: borderRadius25, color: Colors.white),
                  alignment: Alignment.center,
                  child: Lottie.asset(logoJson, fit: BoxFit.cover, animate: true, width: 180, height: 180),
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: Get.size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              isScrollable: true,
                              indicatorColor: kPrimaryColor,
                              automaticIndicatorColorAdjustment: true,
                              labelStyle: const TextStyle(fontFamily: normsProSemiBold, fontSize: 22),
                              unselectedLabelStyle: const TextStyle(fontFamily: normsProMedium),
                              labelColor: Colors.black,
                              indicatorWeight: 4,
                              indicatorPadding: const EdgeInsets.only(top: 45, right: 25),
                              indicator: const BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                              unselectedLabelColor: Colors.grey,
                              tabs: [
                                Tab(
                                  text: "signUp".tr,
                                ),
                                Tab(
                                  text: "signIn".tr,
                                )
                              ]),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        child: TabBarView(
                          children: [SingIn(), Login()],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      IconlyLight.arrowLeftCircle,
                      color: Colors.black,
                      size: 30,
                    ))),
          ],
        ),
      ),
    );
  }
}
