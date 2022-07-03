// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:arzan/components/appBar.dart';
import 'package:arzan/components/constants/constants.dart';
import '../../../components/constants/widgets.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const MyAppBar(backArrow: true, iconRemove: true, elevation: 0, name: "comments"),
      body: Column(
        children: [
          customDivider(),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: const BoxDecoration(borderRadius: borderRadius20, color: Colors.white),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.white),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.only(right: 12),
                      childrenPadding: const EdgeInsets.only(left: 25, top: 10, bottom: 10, right: 25),
                      expandedAlignment: Alignment.centerLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Haryt ady ",
                            style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 20),
                          ),
                          Expanded(
                            child: Text(
                              " • 13.02.2022ý",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      subtitle: const Text(
                        loremImpsum,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontFamily: normsProMedium),
                      ),
                      leading: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(borderRadius: borderRadius5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/products/${index + 1}.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      children: [
                        const Text(
                          loremImpsum,
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.grey, fontFamily: normsProMedium),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  IconlyBold.edit,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  IconlyBold.delete,
                                  color: Colors.black,
                                  size: 26,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.eye_fill,
                                  color: Colors.black,
                                  size: 26,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
