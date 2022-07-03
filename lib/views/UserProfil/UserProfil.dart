// ignore_for_file: file_names

import 'package:arzan/views/UserProfil/Pages/addedProducts.dart';
import 'package:arzan/controllers/SettingsController.dart';
import 'package:arzan/views/others/index.dart';

import 'Auth/TabbarView.dart';
import 'Pages/AboutUs.dart';
import 'Pages/BookmarkPage.dart';
import 'Pages/Comments.dart';
import 'Pages/FAQs.dart';
import 'Pages/ProfileSettings.dart';
import 'Pages/Settings.dart';

class UserProfil extends StatelessWidget {
  UserProfil({Key? key}) : super(key: key);
  final SettingsController settingsController = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          backArrow: false,
          iconRemove: true,
          name: "profil".tr,
          elevation: 1,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            ProfilButton(
                name: "profil",
                onTap: () {
                  Get.to(() => const ProfileSettings());
                },
                icon: IconlyLight.profile),
            ProfilButton(
                name: "settings",
                onTap: () {
                  Get.to(() => const Settings());
                },
                icon: IconlyLight.setting),
            ProfilButton(
                name: "favorite",
                onTap: () {
                  Get.to(() => const BookMarkPage());
                },
                icon: IconlyLight.bookmark),
            divider(),
            ProfilButton(name: "editWorkProfile", onTap: () {}, icon: IconlyLight.home),
            ProfilButton(
                name: "Gosan harytlarym",
                onTap: () {
                  Get.to(() => const AddedProducts());
                },
                icon: IconlyLight.category),
            ProfilButton(
                name: "comments",
                onTap: () {
                  Get.to(() => const CommentsPage());
                },
                icon: IconlyLight.chat),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(
                color: backgroundColor,
                thickness: 2,
              ),
            ),
            ProfilButton(
                name: "questions",
                onTap: () {
                  Get.to(() => const FAQs());
                },
                icon: IconlyLight.document),
            ProfilButton(
                name: "aboutUs",
                onTap: () {
                  Get.to(() => AboutUs());
                },
                icon: IconlyLight.user3),
            ProfilButton(
                // name: settingsController.loginUser.value ? "log_out" : "signUp",
                name: "signUp",
                onTap: () {
                  Get.to(() => const TabBarViewPage());
                },
                icon: IconlyLight.login),
            const SizedBox(
              height: 100,
            )
          ],
        )));
  }

  Padding divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Divider(
        color: backgroundColor,
        thickness: 2,
      ),
    );
  }
}
