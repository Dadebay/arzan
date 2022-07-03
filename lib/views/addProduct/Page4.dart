// ignore_for_file: deprecated_member_use, file_names, depend_on_referenced_packages, avoid_void_async, always_declare_return_types, type_annotate_public_apis, unnecessary_statements, unrelated_type_equality_checks

import 'dart:io';

import 'package:arzan/controllers/AddPageController.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';

import 'package:arzan/views/others/index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final AddPageController addPageController = Get.put(AddPageController());

  final List<XFile> _imageFileList = [];
  final ImagePicker _picker = ImagePicker();
  void selectImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage(imageQuality: 25);
    if (selectedImages!.length <= 15) {
      setState(() {
        final int a = selectedImages.length;
        final int b = _imageFileList.length;
        if (a + b <= 15) {
          if (b <= 15) {
            for (int i = 0; i < a; i++) {
              if (((File(selectedImages[i].path).readAsBytesSync().length / 1024) / 1024) < 1) {
                _imageFileList.add(selectedImages[i]);
                addPageController.imageArray.add(false);
              } else {
                showSnackBar("mbErrorTitle", "mbErrorSubtitle", kPrimaryColor);
                // Vibration.vibrate();
              }
            }
          } else {
            showSnackBar("selectMoreImageTitle", "selectMoreImageSubtitle", kPrimaryColor);
            // Vibration.vibrate();
          }
        } else {
          showSnackBar("selectMoreImageTitle", "selectMoreImageSubtitle", kPrimaryColor);
          // Vibration.vibrate();
        }
      });
    } else {
      showSnackBar("selectMoreImageTitle", "selectMoreImageSubtitle", kPrimaryColor);
      // Vibration.vibrate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          width: Get.size.width,
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "selectImages".tr,
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 18),
            ),
            Text(
              "selectImagesCount".tr,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey[400], fontFamily: normsProMedium, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: _imageFileList.isEmpty ? 1 : _imageFileList.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () async {
                          await Permission.camera.request();
                          await Permission.photos.request();
                          selectImages();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            padding: const EdgeInsets.all(6),
                            strokeWidth: 2,
                            color: kPrimaryColor,
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(borderRadius: borderRadius10),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 10,
                            bottom: 5,
                            left: 5,
                            right: 10,
                            child: Material(
                              elevation: 2,
                              borderRadius: borderRadius10,
                              child: ClipRRect(
                                borderRadius: borderRadius10,
                                child: Image.file(File(_imageFileList[index - 1].path), fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            top: 10,
                            bottom: 5,
                            left: 5,
                            right: 10,
                            child: Obx(() => Center(
                                  child: addPageController.imageArray[index - 1] == true
                                      ? Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.65),
                                            borderRadius: borderRadius10,
                                          ),
                                          child: Center(child: Container(padding: const EdgeInsets.all(8), decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green), child: const Icon(Icons.done, color: Colors.white, size: 25))),
                                        )
                                      : const SizedBox.shrink(),
                                )),
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: Obx(() => addPageController.imageArray[index - 1] == true
                                  ? const SizedBox.shrink()
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _imageFileList.removeAt(index - 1);
                                          addPageController.imageArray.removeAt(index - 1);
                                        });
                                      },
                                      child: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.red)))),
                        ],
                      ),
                    );
                  }),
            ),
            // agreeButton2()
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: AgreeButton(
                onTap: () {
                  // addPageController.();
                  addPageController.incrementPageIndex();
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const MyCustomSplashScreen()));
                },
              ),
            )
          ])),
    );
  }
}
