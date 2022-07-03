// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import 'package:arzan/views/others/index.dart';

import '../Auth/ForgotPassword.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool showNotification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        backArrow: true,
        iconRemove: true,
        name: "settings",
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Divider(
              thickness: 1,
              color: backgroundColor,
              height: 1,
            ),
            SettingButton(
                name: Get.locale!.toLanguageTag() == "tr" ? "Türkmen dili" : "Rus dili",
                onTap: () {
                  changeLanguage();
                },
                icon: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                    child: ClipRRect(
                      borderRadius: borderRadius30,
                      child: Image.asset(
                        Get.locale!.toLanguageTag() == "tr" ? tmIcon : ruIcon,
                        fit: BoxFit.cover,
                      ),
                    ))),
            SettingButton(
                name: showNotification ? "hideNotifications" : "showNotifications",
                onTap: () {},
                icon: CupertinoSwitch(
                    value: showNotification,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        showNotification = !showNotification;
                      });
                    })),
            SettingButton(
                name: "termsAndCondition",
                onTap: () {
                  termsAndConditionWidget();
                },
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.arrowRightCircle,
                      color: Colors.black,
                    ))),
            SettingButton(
                name: "changePassword".tr,
                onTap: () {
                  Get.to(() => const ForgotPassword());
                },
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.arrowRightCircle,
                      color: Colors.black,
                    ))),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(
                color: backgroundColor,
                thickness: 2,
              ),
            ),
            SettingButton(
                name: "versia",
                onTap: () {},
                icon: const Text(
                  "1.0.0",
                  style: TextStyle(color: kPrimaryColor, fontFamily: normsProSemiBold),
                )),
            SettingButton(
                name: "share",
                onTap: () {
                  Share.share('https://play.google.com/store/apps/details?id=com.bilermennesil.gamysh', subject: 'Gamyş');
                },
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.arrowRightCircle,
                      color: Colors.black,
                    ))),
            SettingButton(
                name: "giveLike",
                onTap: () {
                  _launchURL('https://play.google.com/store/apps/details?id=com.bilermennesil.gamysh');
                },
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.arrowRightCircle,
                      color: Colors.black,
                    ))),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
