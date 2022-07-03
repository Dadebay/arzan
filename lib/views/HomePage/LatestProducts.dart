import 'package:arzan/components/cards/latestProductCard.dart';
import 'package:arzan/components/constants/constants.dart';
import 'package:arzan/views/others/ProductProfil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LattestProducts extends StatelessWidget {
  const LattestProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Latest Products".tr, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: normsProBold))),
                const Text(
                  "View all",
                  style: TextStyle(color: kPrimaryColor, fontFamily: normsProMedium, fontSize: 14),
                )
              ],
            ),
          ),
        ),
        ListView.builder(
          itemCount: 23,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => const ProductProfil());
              },
              child: LatestProductsCard(
                index: index,
                waitng: false,
                agree: false,
                rejected: false,
              ),
            );
          },
        )
      ],
    );
  }
}
