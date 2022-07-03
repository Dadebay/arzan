import 'package:arzan/components/constants/constants.dart';
import 'package:arzan/controllers/SettingsController.dart';
import 'package:arzan/views/UserProfil/Pages/NotificationsPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class SliverAppBarMine extends StatelessWidget {
  const SliverAppBarMine({Key? key, required this.isPinned}) : super(key: key);
  final bool isPinned;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        expandedHeight: 300,
        automaticallyImplyLeading: false,
        floating: false,
        pinned: true,
        centerTitle: true,
        title: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          curve: Curves.decelerate,
          opacity: isPinned ? 1 : 0,
          child: const Text(
            "ARZAN",
            style: TextStyle(color: Colors.black, fontSize: 22, fontFamily: normsProBold),
          ),
        ),
        backgroundColor: Colors.white,
        flexibleSpace: Stack(
          children: [
            Positioned.fill(
                child: AnimatedOpacity(
              opacity: isPinned ? 0 : 1,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.decelerate,
              child: CarouselSlider.builder(
                itemCount: 4,
                itemBuilder: (context, index, count) {
                  return Image.asset(
                    "assets/images/banners/${index + 1}.jpg",
                    fit: BoxFit.fill,
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, CarouselPageChangedReason) {
                    Get.find<SettingsController>().bannerSelectedIndex.value = index;
                  },
                  height: 335,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                ),
              ),
            )),
            Positioned(
              top: 30,
              right: 0,
              child: GestureDetector(
                  onTap: () {
                    Get.to(() => const Notifications());
                  },
                  child: Container(padding: const EdgeInsets.all(8), margin: const EdgeInsets.only(right: 15, top: 7, bottom: 7), decoration: const BoxDecoration(color: Colors.white, borderRadius: borderRadius10), child: const Icon(IconlyLight.notification, color: Colors.black))),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              child: isPinned
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 20,
                      width: Get.size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(() {
                              return AnimatedContainer(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate,
                                height: Get.find<SettingsController>().bannerSelectedIndex.value == index ? 16 : 7,
                                width: Get.find<SettingsController>().bannerSelectedIndex.value == index ? 15 : 7,
                                decoration: BoxDecoration(
                                  color: Get.find<SettingsController>().bannerSelectedIndex.value == index ? Colors.transparent : Colors.white,
                                  shape: BoxShape.circle,
                                  border: Get.find<SettingsController>().bannerSelectedIndex.value == index ? Border.all(color: kPrimaryColor, width: 3) : Border.all(color: Colors.white),
                                ),
                              );
                            });
                          }),
                    ),
            ),
          ],
        ));
  }
}
