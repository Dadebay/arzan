// ignore_for_file: file_names, deprecated_member_use

import 'package:arzan/components/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:arzan/components/appBar.dart';
import '../../../components/constants/constants.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
          elevation: 1,
          backArrow: true,
          iconRemove: true,
          icon: IconButton(
            icon: const Icon(
              IconlyLight.delete,
              color: Colors.black,
            ),
            onPressed: () {
              showDeleteDialog(context);
            },
          ),
          name: "notification".tr),
      body: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              notificationImage(),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("1 haryt alan 3 haryt mugt ", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: normsProMedium, fontSize: 18, color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4, right: 8),
                    child: Text("Berkarar sowda merkezinin 3nji etazynyn 90-njy dukany", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: normsProMedium, fontSize: 14, color: Colors.grey.shade500)),
                  ),
                  Text("$index.04.2022", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: normsProMedium, fontSize: 12, color: Colors.grey.shade500)),
                ],
              ))
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey.shade300,
          );
        },
      ),
    );
  }

  Container notificationImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(borderRadius: borderRadius15, color: kPrimaryColor.withOpacity(0.6)),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    );
  }
}
