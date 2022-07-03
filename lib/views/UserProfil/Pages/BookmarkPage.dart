// ignore_for_file: file_names

import 'package:arzan/components/appBar.dart';
import 'package:arzan/components/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
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
          name: "favorite"),
      body: const Center(child: Text("Favorited Products Card")),
    );
  }
}
