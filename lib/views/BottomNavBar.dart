// ignore_for_file: missing_return, file_names, must_be_immutable, require_trailing_commas

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../components/constants/constants.dart';
import 'HomePage/HomePage.dart';
import 'PaymentPage/PaymentPage.dart';
import 'SearchPage/SearchPage.dart';
import 'UserProfil/UserProfil.dart';
import 'addProduct/AddRealEstatePage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  final storage = GetStorage();
  @override
  void initState() {
    super.initState();
    storage.write("onboarding", true);
  }

  List page = [
    const HomePage(),
    const SearchPage(),
    AddProductPage(),
    const PaymentPage(),
    UserProfil(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 22,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontFamily: normsProSemiBold),
          unselectedLabelStyle: const TextStyle(fontFamily: normsProMedium),
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.black,
          currentIndex: selectedIndex,
          onTap: (index) async {
            setState(() {
              if (index == 2) {
                Get.to(() => AddProductPage());
              } else {
                selectedIndex = index;
              }
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                IconlyLight.home,
              ),
              activeIcon: const Icon(
                IconlyBold.home,
                color: kPrimaryColor,
                size: 25,
              ),
              label: "home".tr,
              tooltip: "home".tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(IconlyLight.search),
              activeIcon: const Icon(
                IconlyBold.search,
                color: kPrimaryColor,
                size: 25,
              ),
              label: "search".tr,
              tooltip: "search".tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                IconlyLight.plus,
                size: 24,
              ),
              activeIcon: const Icon(
                IconlyBold.plus,
                color: kPrimaryColor,
                size: 25,
              ),
              label: "add".tr,
              tooltip: "add".tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                IconlyLight.wallet,
                size: 24,
              ),
              activeIcon: const Icon(
                IconlyBold.wallet,
                color: kPrimaryColor,
                size: 25,
              ),
              label: "Payment".tr,
              tooltip: "Payment".tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(IconlyLight.profile),
              activeIcon: const Icon(
                IconlyBold.profile,
                color: kPrimaryColor,
                size: 25,
              ),
              label: "profil".tr,
              tooltip: "profil".tr,
            ),
          ],
        ),
        body: Center(
          child: page[selectedIndex],
        ));
  }
}
