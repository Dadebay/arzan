import 'package:arzan/components/appBar.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        backArrow: true,
        iconRemove: false,
        name: "Edit Product",
        elevation: 0,
      ),
      body: Center(
        child: Text("Edit Product"),
      ),
    );
  }
}
