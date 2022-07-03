// ignore_for_file: file_names, always_declare_return_types, type_annotate_public_apis, avoid_dynamic_calls

import 'dart:ui';

import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final storage = GetStorage();
  RxInt bannerSelectedIndex = 0.obs; //banner setState ulanman gecirmek ucin
  RxBool agreeButton = false.obs;
  RxBool showOTP = false.obs; // sign up otp gorkezmek ucin
  RxBool categoryList = false.obs; // Search Page app bar yokary etmek ucin

  var tm = const Locale(
    'tr',
  );
  var ru = const Locale(
    'ru',
  );
  var en = const Locale(
    'en',
  );

  switchLang(String value) {
    if (value == "en") {
      Get.updateLocale(en);
      storage.write('langCode', 'en');
    } else if (value == "ru") {
      Get.updateLocale(ru);
      storage.write('langCode', 'ru');
    } else {
      Get.updateLocale(tm);
      storage.write('langCode', 'tr');
    }
    update();
  }
}
