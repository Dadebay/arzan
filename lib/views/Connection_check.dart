// ignore_for_file: file_names, always_use_package_imports

import 'dart:async';
import 'package:arzan/components/constants/constants.dart';
import 'package:arzan/views/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyCustomSplashScreen extends StatefulWidget {
  const MyCustomSplashScreen({Key? key}) : super(key: key);

  @override
  _MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State with TickerProviderStateMixin {
  Animation? animation1;

  double _containerOpacity = 0.0;
  int _containerSize = 1;
  late AnimationController _controller;
  double _fontSize = 2.0;
  double _textOpacity = 0.0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween(begin: 40, end: 20).animate(CurvedAnimation(parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 6), () {
      setState(() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const BottomNavBar()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(duration: const Duration(milliseconds: 2000), curve: Curves.fastLinearToSlowEaseIn, height: Get.size.height / _fontSize),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: const Text(
                  "ARZAN",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 4,
                    fontFamily: normsProBold,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: Get.size.width / _containerSize,
                width: Get.size.width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Lottie.asset("assets/lottie/lf30_editor_qcvhsaqp.json", fit: BoxFit.cover, animate: true, width: 180, height: 180),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
