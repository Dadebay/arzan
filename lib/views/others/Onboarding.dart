// ignore_for_file: file_names, must_be_immutable

import 'package:arzan/components/buttons/dialogs.dart';
import 'package:arzan/components/constants/constants.dart';
import 'package:arzan/views/Connection_check.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  List title = [
    "Hoş geldiňiz",
    "Halaň we Paýlaşyň",
    "Gözleg",
  ];
  List subtitle = [
    "Arzan - Ähli hyzmatlaryň we harytlaryň arzan bahasyny Arzanda tapyň",
    "Halan arzanlaşygyňyzy ýada aksiýäňyzy öz doslaryňzy bilen paýlaşyň.",
    "Gerekli harydyňyzyň adyny gözleg setirine yazyň we Arzan size şol haryda degişli hemme arzanlaşyklary çykarsyn.",
  ];
  List images = [
    "assets/images/arzan/1.png",
    "assets/images/arzan/2.png",
    "assets/images/arzan/3.png",
  ];

  Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: const [Color(0xffacd1a5), Color(0xffcfe7c3), Color(0xffe3e8eb)],
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        verticalPosition: 0.85,
        onFinish: () {
          selectCity(onTap: () {
            Get.to(() => const MyCustomSplashScreen());
          });
        },
        nextButtonBuilder: (BuildContext context) {
          return const Icon(
            IconlyLight.arrowRightCircle,
            color: Colors.black,
            size: 45,
          );
        },
        itemBuilder: (int index) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  width: Get.size.width,
                  height: Get.size.height / 1.6,
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    title[index],
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(fontFamily: normsProBold, color: Colors.black, fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    subtitle[index],
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: const TextStyle(fontFamily: normsProSemiBold, color: Colors.black, fontSize: 19),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
