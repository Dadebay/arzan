import 'package:arzan/components/ListViewName.dart';
import 'package:arzan/components/buttons/bookmarkButton.dart';
import 'package:arzan/components/constants/constants.dart';
import 'package:arzan/views/others/ProductProfil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecomendedPart extends StatelessWidget {
  const RecomendedPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListViewName(name: "Recomended ", onTap: () {}),
        SizedBox(
          height: 290,
          child: ListView.builder(
            itemCount: 22,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => const ProductProfil());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8, bottom: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: 180,
                          decoration: const BoxDecoration(color: Colors.amber, borderRadius: borderRadius5),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  "assets/images/products/${index + 1}.png",
                                  fit: BoxFit.fill,
                                ),
                              )),
                              const Positioned(
                                  top: 8,
                                  right: 8,
                                  child: BookMarkButton(
                                    color: true,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 6, bottom: 4),
                        child: Text(
                          "  Haryt Ady",
                          style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 18),
                        ),
                      ),
                      const Text(
                        "  10.06.2022",
                        style: TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
