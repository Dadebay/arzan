// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:arzan/components/appBar.dart';
import 'package:arzan/components/constants/constants.dart';

class FAQs extends StatelessWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(backArrow: true, elevation: 1, iconRemove: true, name: "questions"),
      body: SingleChildScrollView(
        child: Column(children: const [
          ExpansionTile(
            title: Text(
              "Nädip agza bolmaly ?",
              style: TextStyle(
                color: Colors.black,
                fontFamily: normsProSemiBold,
              ),
            ),
            childrenPadding: EdgeInsets.only(left: 12, right: 12, top: 0, bottom: 12),
            children: [
              Text(
                loremImpsum,
                style: TextStyle(color: Colors.black, fontFamily: normsProMedium),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
              "Nädip hyzmat goşmaly ?",
              style: TextStyle(
                color: Colors.black,
                fontFamily: normsProSemiBold,
              ),
            ),
            childrenPadding: EdgeInsets.only(left: 12, right: 12, top: 0, bottom: 12),
            children: [
              Text(
                loremImpsum,
                style: TextStyle(color: Colors.black, fontFamily: normsProMedium),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
              "Hyzmat näçe wagt durýar ?",
              style: TextStyle(
                color: Colors.black,
                fontFamily: normsProSemiBold,
              ),
            ),
            childrenPadding: EdgeInsets.only(left: 12, right: 12, top: 0, bottom: 12),
            children: [
              Text(
                loremImpsum,
                style: TextStyle(color: Colors.black, fontFamily: normsProMedium),
              )
            ],
          )
        ]),
      ),
    );
  }
}
