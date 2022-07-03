// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, unnecessary_statements

import 'package:flutter/material.dart';

import 'constants/constants.dart';

class BrandCard extends StatefulWidget {
  final int index;
  final String name;
  const BrandCard({Key? key, required this.index, required this.name}) : super(key: key);

  @override
  State<BrandCard> createState() => _BrandCardState();
}

class _BrandCardState extends State<BrandCard> {
  bool buttonPress = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 130,
            height: 130,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
            child: ClipOval(
              child: Image.asset(
                "assets/images/brands/${widget.index + 1}.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "User Name",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: normsProSemiBold),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                buttonPress = !buttonPress;
              });
            },
            color: buttonPress ? kPrimaryColor : Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: borderRadius5, side: BorderSide(color: buttonPress ? kPrimaryColor : backgroundColor, width: 2)),
            disabledColor: Colors.white,
            child: Text(
              buttonPress ? "Followed" : "Follow",
              style: TextStyle(color: buttonPress ? Colors.white : Colors.black, fontSize: 16, fontFamily: buttonPress ? normsProSemiBold : normsProMedium),
            ),
          )
        ],
      ),
    );
  }
}
