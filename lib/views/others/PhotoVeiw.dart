// ignore_for_file: file_names, require_trailing_commas, void_checks

import 'package:arzan/components/constants/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  _PhotoViewPageState createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          fit: StackFit.expand,
          children: [
            CarouselSlider.builder(
              itemCount: 12,
              options: CarouselOptions(viewportFraction: 1.0, height: Get.size.height),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return PhotoView(
                  imageProvider: AssetImage(
                    widget.image,
                  ),
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2.0,
                  enableRotation: false,
                  initialScale: PhotoViewComputedScale.contained,
                );
              },
            ),
            bottomContainer(),
            topButtons(),
          ],
        ),
      ),
    );
  }

  Align bottomContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        height: 130,
        decoration: const BoxDecoration(color: Colors.white, borderRadius: borderRadius20),
        child: Material(
          color: Colors.white,
          borderRadius: borderRadius20,
          elevation: 1,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    child: ClipRRect(
                      borderRadius: borderRadius10,
                      child: Image.asset(
                        "assets/images/Damatlik/3.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Product name",
                          style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: normsProSemiBold),
                        ),
                        Text(
                          "Product Brand",
                          style: TextStyle(color: Colors.grey, fontFamily: normsProMedium),
                        ),
                        Text(
                          "1200 TMT",
                          style: TextStyle(color: Colors.black, fontSize: 17, fontFamily: normsProSemiBold),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    IconlyLight.arrowRight2,
                    color: Colors.white,
                    size: 25,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                    elevation: MaterialStateProperty.all(1),
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor), // <-- Button color
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Align topButtons() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    IconlyLight.arrowLeft,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    IconlyLight.heart,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
