// ignore_for_file: file_names

import 'package:arzan/components/appBar.dart';
import 'package:flutter/material.dart';

class ShowAllProducts extends StatelessWidget {
  const ShowAllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(backArrow: true, iconRemove: true, elevation: 1, name: "Hemme harytlar"),
      body: Center(child: Text("Like Sanynan ")),
    );
  }
}
