// ignore_for_file: file_names

import 'package:arzan/components/ListViewName.dart';
import 'package:arzan/components/constants/widgets.dart';
import 'package:arzan/views/HomePage/LatestProducts.dart';
import 'package:arzan/views/HomePage/OfficialUser.dart';
import 'package:arzan/views/HomePage/recomendedPart.dart';
import 'package:arzan/views/HomePage/sliverAppBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPinned = false;

  final ScrollController _sliverScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _sliverScrollController.addListener(() {
      print(_sliverScrollController.offset);

      if (!isPinned && _sliverScrollController.hasClients && _sliverScrollController.offset >= 130.0) {
        setState(() {
          isPinned = true;
          print(isPinned);
        });
      } else if (isPinned && _sliverScrollController.hasClients && _sliverScrollController.offset <= 130.0) {
        setState(() {
          isPinned = false;
          print(isPinned);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: CustomScrollView(
          controller: _sliverScrollController,
          slivers: [
            SliverAppBarMine(isPinned: isPinned),
            SliverToBoxAdapter(
              child: Wrap(
                children: [
                  customDivider(),
                  const SizedBox(
                    height: 20,
                  ),
                  const OfficialUsersHomePage(),
                  const RecomendedPart(),
                  const LattestProducts(),
                ],
              ),
            )
          ],
        ));
  }
}
