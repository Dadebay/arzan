// ignore_for_file: file_names

import 'package:arzan/components/constants/constants.dart';
import 'package:arzan/components/constants/widgets.dart';
import 'package:arzan/components/searchCard.dart';
import 'package:arzan/controllers/SettingsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  final ScrollController scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    Get.find<SettingsController>().categoryList.value = false;
    searchController.addListener(() {
      setState(() {});
    });
    scrollCtrl.addListener(() {
      if (scrollCtrl.position.pixels > 10) {
        Get.find<SettingsController>().categoryList.value = true;
      } else if (Get.find<SettingsController>().categoryList.value == true && scrollCtrl.position.pixels < 10) {
        Get.find<SettingsController>().categoryList.value = false;
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  bool showDialog = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          body: Stack(
        children: [
          Column(
            children: [
              appbar(),
              customDivider(),
              subCategory(),
              Expanded(
                child: searched
                    ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(searchNotFound),
                            const Text(
                              "Gözleg tapylmady !",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 22),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 30),
                              child: Text(
                                "Gözlegiňiz tapylmady täzeden synanşyň",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      )
                    : StaggeredGridView.countBuilder(
                        controller: scrollCtrl,
                        staggeredTileBuilder: (index) => StaggeredTile.count(1, index % 2 == 0 ? 1.2 : 1.5),
                        mainAxisSpacing: 8, // vertical spacing between items
                        crossAxisSpacing: 8, // horizontal spacing between items
                        crossAxisCount: 2, // no. of virtual columns in grid
                        itemCount: 23,
                        itemBuilder: (context, index) => SearchCard(index: index),
                      ),
              ),
            ],
          ),
          AnimatedContainer(
            margin: const EdgeInsets.only(top: 70, left: 15, right: 15),
            height: showDialog ? 290 : 0,
            width: Get.size.width,
            curve: Curves.decelerate,
            decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius5, boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 15, offset: const Offset(1, 15), spreadRadius: 5)]),
            duration: const Duration(milliseconds: 500),
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    searchController.text = "Recomended seacrh $index";
                    searched = true;
                    showDialog = false;
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Recomended seacrh $index",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
              itemCount: 8,
              separatorBuilder: (BuildContext context, int index) {
                return customDivider();
              },
            ),
          )
        ],
      )),
    );
  }

  List value = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  Widget subCategory() {
    return Container(
      height: 55,
      color: Colors.white,
      child: ListView.builder(
        itemCount: value.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  for (int i = 0; i < value.length; i++) {
                    if (value[i] == true) {
                      value[i] = false;
                    }
                  }
                  value[index] = true;
                  searched = true;
                  searchController.text = "#Hastag $index";
                });
              },
              elevation: 0,
              focusElevation: 2,
              hoverElevation: 2,
              hoverColor: kPrimaryColor.withOpacity(0.4),
              splashColor: kPrimaryColor.withOpacity(0.6),
              highlightElevation: 2,
              color: value[index] ? kPrimaryColor : Colors.grey.withOpacity(0.2),
              shape: const RoundedRectangleBorder(
                borderRadius: borderRadius10,
              ),
              child: Text(
                "#Hastag $index",
                style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }

  bool searched = false;

  Obx appbar() {
    return Obx(() {
      return AnimatedCrossFade(
          firstChild: Container(
            color: Colors.white,
            width: Get.size.width,
          ),
          secondChild: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            color: Colors.white,
            child: TextField(
              cursorColor: Colors.black,
              cursorHeight: 23,
              onTap: () {
                setState(() {
                  showDialog = !showDialog;
                });
              },
              controller: searchController,
              style: const TextStyle(fontFamily: normsProSemiBold, fontSize: 18),
              decoration: InputDecoration(
                fillColor: backgroundColor,
                hintText: "Gözleg ....",
                contentPadding: EdgeInsets.zero,
                hintStyle: const TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 20),
                filled: true,
                isDense: true,
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          for (int i = 0; i < value.length; i++) {
                            if (value[i] == true) {
                              value[i] = false;
                            }
                          }
                          searchController.clear();
                          showDialog = false;
                          searched = false;
                          setState(() {});
                        },
                        icon: const Icon(
                          CupertinoIcons.xmark,
                          color: Colors.black,
                        ))
                    : const SizedBox.shrink(),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(right: 15, left: 12),
                  child: Icon(
                    IconlyLight.search,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
                border: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
                disabledBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
                enabledBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
                focusedBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: kPrimaryColor, width: 2)),
              ),
            ),
          ),
          firstCurve: Curves.easeInCubic,
          secondCurve: Curves.fastOutSlowIn,
          crossFadeState: Get.find<SettingsController>().categoryList.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 400));
    });
  }
}
