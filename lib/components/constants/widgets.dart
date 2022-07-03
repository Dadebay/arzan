// ignore_for_file: deprecated_member_use, duplicate_ignore, implementation_imports, avoid_positional_boolean_parameters, unnecessary_null_comparison, always_use_package_imports

import 'package:arzan/views/Connection_check.dart';
import 'package:arzan/views/others/index.dart';

SnackbarController showSnackBar(String title, String subtitle, Color color) {
  return Get.snackbar(
    title,
    subtitle,
    snackStyle: SnackStyle.FLOATING,
    titleText: title == ""
        ? const SizedBox.shrink()
        : Text(
            title.tr,
            style: const TextStyle(fontFamily: normsProSemiBold, fontSize: 16, color: Colors.white),
          ),
    messageText: Text(
      subtitle.tr,
      style: const TextStyle(fontFamily: normsProRegular, fontSize: 14, color: Colors.white),
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color,
    borderRadius: 20.0,
    animationDuration: const Duration(milliseconds: 1000),
    margin: const EdgeInsets.all(8),
  );
}

Widget dividerr() {
  return Container(
    color: Colors.grey[300],
    width: double.infinity,
    height: 1,
  );
}

customDivider() {
  return const Divider(
    thickness: 1,
    color: backgroundColor,
    height: 1,
  );
}

showDeleteDialog(BuildContext context) {
  showGeneralDialog(
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.decelerate.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 400, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
                backgroundColor: Colors.white,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                title: Text(
                  "dialogText".tr,
                  style: const TextStyle(color: Colors.black, fontSize: 24, fontFamily: normsProSemiBold),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 6, right: 6),
                      child: Text(
                        "dialogSubtitle".tr,
                        style: const TextStyle(color: Colors.black, fontSize: 18, fontFamily: normsProMedium),
                      ),
                    ),
                    Row(
                      children: [
                        dialogButton("no", () {
                          Get.back();
                        }, false),
                        const SizedBox(
                          width: 10,
                        ),
                        dialogButton("yes", () {
                          Get.back();
                        }, true),
                      ],
                    )
                  ],
                )),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox.shrink();
      });
}

Future<Object?> sendSMS(BuildContext context) {
  return showGeneralDialog(
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.decelerate.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 400, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
                backgroundColor: Colors.white,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                title: Text(
                  "SMS".tr,
                  style: const TextStyle(color: Colors.black, fontSize: 24, fontFamily: normsProSemiBold),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      maxLines: 3,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black, fontFamily: normsProMedium),
                      decoration: InputDecoration(
                          hintText: "Sms hat yazyň",
                          border: OutlineInputBorder(borderRadius: borderRadius20, borderSide: BorderSide(color: Colors.grey.shade200, width: 2)),
                          focusedBorder: const OutlineInputBorder(borderRadius: borderRadius20, borderSide: BorderSide(color: kPrimaryColor, width: 2)),
                          enabledBorder: OutlineInputBorder(borderRadius: borderRadius20, borderSide: BorderSide(color: Colors.grey.shade200, width: 2))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: Get.size.width,
                      child: RaisedButton(
                          onPressed: () {},
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          color: kPrimaryColor,
                          shape: const RoundedRectangleBorder(borderRadius: borderRadius20),
                          child: Text(
                            "send".tr,
                            style: const TextStyle(color: Colors.black, fontSize: 18, fontFamily: normsProSemiBold),
                          )),
                    ),
                  ],
                )),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox.shrink();
      });
}

Widget dialogButton(String name, Function() onTap, bool color) {
  return Expanded(
    child: RaisedButton(
        onPressed: onTap,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        color: kPrimaryColor,
        shape: const RoundedRectangleBorder(borderRadius: borderRadius20),
        child: Text(
          name.tr,
          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: color ? normsProMedium : normsProSemiBold),
        )),
  );
}

Future<dynamic> selectCity() {
  return Get.defaultDialog(
      barrierDismissible: false,
      title: "selectCityTitle".tr,
      titleStyle: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold),
      radius: 5,
      titlePadding: const EdgeInsets.symmetric(vertical: 14),
      contentPadding: const EdgeInsets.only(),
      content: Column(
        children: [
          customDivider(),
          TextButton(
            onPressed: () {
              Get.to(() => const MyCustomSplashScreen());
            },
            child: const Text(
              "Ashgabat",
              style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 16),
            ),
          ),
          customDivider(),
          TextButton(
            onPressed: () {
              Get.to(() => const MyCustomSplashScreen());
            },
            child: const Text(
              "Ahal",
              style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 16),
            ),
          ),
          customDivider(),
          TextButton(
            onPressed: () {
              Get.to(() => const MyCustomSplashScreen());
            },
            child: const Text(
              "Balkan",
              style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 16),
            ),
          ),
          customDivider(),
          TextButton(
            onPressed: () {
              Get.to(() => const MyCustomSplashScreen());
            },
            child: const Text(
              "Mary",
              style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 16),
            ),
          ),
          customDivider(),
          TextButton(
            onPressed: () {
              Get.to(() => const MyCustomSplashScreen());
            },
            child: const Text(
              "Lebap",
              style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 16),
            ),
          ),
          customDivider(),
          TextButton(
            onPressed: () {
              Get.to(() => const MyCustomSplashScreen());
            },
            child: const Text(
              "Daşoguz",
              style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 16),
            ),
          ),
        ],
      ));
}
