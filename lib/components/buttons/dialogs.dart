import 'package:arzan/controllers/SettingsController.dart';
import 'package:flutter/cupertino.dart';

import 'package:arzan/views/others/index.dart';

void logOut() {
  Get.bottomSheet(Container(
    decoration: const BoxDecoration(color: Colors.white),
    child: Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Text(
                "log_out".tr,
                style: const TextStyle(color: Colors.black, fontFamily: normsProMedium, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(CupertinoIcons.xmark_circle, size: 22, color: Colors.black),
              )
            ],
          ),
        ),
        customDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text("log_out_title".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontFamily: normsProMedium,
                fontSize: 16,
              )),
        ),
        GestureDetector(
          onTap: () async {
            // await Auth().logOut();
            Get.back();

            // Restart.restartApp();
          },
          child: Container(
            width: Get.size.width,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: Colors.red, borderRadius: borderRadius10),
            child: Text(
              "yes".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontFamily: normsProSemiBold, fontSize: 16),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            Get.back();
          },
          child: Container(
            width: Get.size.width,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: borderRadius10),
            child: Text(
              "no".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontFamily: normsProMedium, fontSize: 16),
            ),
          ),
        ),
      ],
    ),
  ));
}

final SettingsController settingsController = Get.put(SettingsController());
void changeLanguage() {
  Get.bottomSheet(Container(
    padding: const EdgeInsets.only(bottom: 20),
    decoration: const BoxDecoration(color: Colors.white),
    child: Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Text(
                "select_language".tr,
                style: const TextStyle(color: Colors.black, fontFamily: normsProMedium, fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(CupertinoIcons.xmark_circle, size: 22, color: Colors.black),
              )
            ],
          ),
        ),
        customDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
              onTap: () {
                settingsController.switchLang("tr");
                Get.back();
              },
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                  tmIcon,
                ),
                backgroundColor: Colors.white,
                radius: 20,
              ),
              title: const Text(
                "Türkmen",
                style: TextStyle(fontFamily: normsProMedium),
              )),
        ),
        customDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
              onTap: () {
                settingsController.switchLang("ru");
                Get.back();
              },
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                  ruIcon,
                ),
                radius: 20,
                backgroundColor: Colors.white,
              ),
              title: const Text(
                "Русский",
                style: TextStyle(fontFamily: normsProMedium),
              )),
        ),
      ],
    ),
  ));
}

Future termsAndConditionWidget() {
  return Get.bottomSheet(
    Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
                Text(
                  "termsAndCondition".tr,
                  style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(CupertinoIcons.xmark, size: 22, color: Colors.black),
                )
              ],
            ),
          ),
          customDivider(),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  loremImpsum,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontFamily: normsProRegular, fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    isScrollControlled: false,
  );
}

void defaultBottomSheet({required String name, required Widget child}) {
  Get.bottomSheet(Container(
    decoration: const BoxDecoration(color: Colors.white),
    child: Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Text(
                name.tr,
                style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(CupertinoIcons.xmark_circle, size: 22, color: Colors.black),
              )
            ],
          ),
        ),
        customDivider(),
        Center(
          child: child,
        )
      ],
    ),
  ));
}
