// ignore_for_file: file_names

import 'package:arzan/controllers/SettingsController.dart';
import 'package:arzan/views/others/index.dart';

class AgreeButton extends StatelessWidget {
  final Function() onTap;

  AgreeButton({Key? key, required this.onTap}) : super(key: key);

  final SettingsController settingsController = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(() {
        return AnimatedContainer(
          decoration: const BoxDecoration(
            borderRadius: borderRadius20,
            color: kPrimaryColor,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: settingsController.agreeButton.value ? 0 : 10),
          width: settingsController.agreeButton.value ? 60 : Get.size.width,
          duration: const Duration(milliseconds: 1000),
          child: settingsController.agreeButton.value
              ? const Center(
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                )
              : Text(
                  "agree".tr,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontFamily: normsProSemiBold, fontSize: 20),
                ),
        );
      }),
    );
  }
}
