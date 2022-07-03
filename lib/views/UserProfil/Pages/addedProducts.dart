// ignore_for_file: file_names

import 'package:arzan/components/appBar.dart';
import 'package:arzan/components/constants/constants.dart';
import 'package:arzan/components/constants/widgets.dart';
import 'package:flutter/material.dart';

class AddedProducts extends StatefulWidget {
  const AddedProducts({Key? key}) : super(key: key);

  @override
  State<AddedProducts> createState() => _AddedProductsState();
}

class _AddedProductsState extends State<AddedProducts> {
  List favNames = ["Garasylyanlar", "Tassyklananlar", "Otkaz edilenler"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
            appBar: const MyAppBar(backArrow: true, elevation: 0, iconRemove: false, name: "Gosan harytlarym"),
            body: Column(
              children: [
                customDivider(),
                Container(
                  color: Colors.white,
                  child: TabBar(
                      labelPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                      labelStyle: const TextStyle(fontFamily: normsProSemiBold, fontSize: 17),
                      unselectedLabelStyle: const TextStyle(fontFamily: normsProMedium, fontSize: 17),
                      labelColor: kPrimaryColor,
                      isScrollable: true,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 1,
                      indicatorPadding: const EdgeInsets.only(top: 50),
                      indicator: const BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                      indicatorColor: kPrimaryColor,
                      tabs: List.generate(
                          favNames.length,
                          (index) => Tab(
                                text: favNames[index],
                              ))),
                ),
                customDivider(),
                Expanded(
                  child: TabBarView(
                      children: List.generate(
                          favNames.length,
                          (index) => SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 1200,
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          favNames[index],
                                          style: const TextStyle(color: kPrimaryColor, fontSize: 30, fontFamily: normsProSemiBold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))),
                )
              ],
            )),
      ),
    );
  }
}
