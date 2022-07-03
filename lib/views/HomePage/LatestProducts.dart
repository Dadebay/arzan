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
              child: Container(
                  width: Get.size.width,
                  height: 160,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200, width: 2), borderRadius: borderRadius10),
                  margin: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: Get.size.height,
                            width: Get.size.width,
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                            child: ClipRRect(
                              borderRadius: borderRadius10,
                              child: Image.asset(
                                "assets/images/products2/${index + 1}.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Haryt Ady",
                                maxLines: 1,
                                style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 20),
                              ),
                              Text(
                                "400 TMT",
                                maxLines: 1,
                                style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 18),
                              ),
                              Text(
                                loremImpsum,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: normsProMedium),
                              ),
                              Text(
                                "10.06.2022  -  Official User Name",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(color: Colors.grey, fontSize: 13, fontFamily: normsProMedium),
                              ),
                            ],
                          ))
                    ],
                  )),
            );
          },
        )
      ],
    );
  }
}
