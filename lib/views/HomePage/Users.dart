import 'package:arzan/components/appBar.dart';
import 'package:arzan/components/brandCard.dart';
import 'package:arzan/components/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        backArrow: false,
        iconRemove: true,
        icon: Icon(
          IconlyLight.search,
          color: Colors.black,
        ),
        name: "Magazynlar",
        elevation: 0,
      ),
      body: Column(
        children: [
          customDivider(),
          Expanded(
            child: GridView.builder(
              itemCount: 12,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.5 / 3),
              itemBuilder: (BuildContext context, int index) {
                return BrandCard(
                  index: index,
                  name: "Page Name",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
