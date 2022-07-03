import 'dart:ui';

import 'package:flutter/material.dart';

import 'buttons/bookmarkButton.dart';
import 'constants/constants.dart';

class SearchCard extends StatelessWidget {
  final int index;
  const SearchCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/products/${index + 1}.png",
                fit: BoxFit.fill,
              ),
            )),
            const Positioned(top: 8, right: 8, child: BookMarkButton()),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 194,
                    padding: const EdgeInsets.only(left: 10, right: 5, top: 8, bottom: 8),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        "Product Name $index",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 18),
                      ),
                      const Text(
                        loremImpsum,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black87, fontFamily: normsProRegular, fontSize: 16),
                      ),
                      const Text("10.06.2022"),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
