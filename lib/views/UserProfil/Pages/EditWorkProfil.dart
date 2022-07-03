// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:arzan/components/appBar.dart';

class EditWorkProfile extends StatelessWidget {
  const EditWorkProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(backArrow: true, elevation: 1, iconRemove: false, name: "editWorkProfile"),
      body: Center(child: Text("Edit Work Profile")),
    );
  }
}
