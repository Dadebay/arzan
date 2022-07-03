// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/constants.dart';

class ListViewName extends StatelessWidget {
  const ListViewName({Key? key, required this.name, required this.onTap}) : super(key: key);
  final String name;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 18, left: 15, top: 20, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(name.tr, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: normsProBold))),
            const Text(
              "View all",
              style: TextStyle(color: kPrimaryColor, fontFamily: normsProMedium, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
