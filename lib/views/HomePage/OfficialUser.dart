import 'package:arzan/components/ListViewName.dart';
import 'package:arzan/components/brandCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Users.dart';

class OfficialUsersHomePage extends StatelessWidget {
  const OfficialUsersHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListViewName(
          name: 'Official Users',
          onTap: () {
            Get.to(() => const Users());
          },
        ),
        Container(
          color: Colors.white,
          height: 250,
          child: ListView.builder(
            itemCount: 17,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return BrandCard(
                index: index,
                name: "Page Name",
                followed: false,
              );
            },
          ),
        ),
      ],
    );
  }
}
