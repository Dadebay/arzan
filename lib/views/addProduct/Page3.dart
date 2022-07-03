// ignore_for_file: file_names

import 'package:arzan/views/others/index.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();

  Widget textField(String name, TextEditingController controllerrr, FocusNode focusNodeee, FocusNode requestedFocus, int maxline) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: TextField(
        cursorColor: Colors.black,
        cursorHeight: 23,
        focusNode: focusNodeee,
        controller: controllerrr,
        maxLines: maxline,
        onTap: () {},
        onEditingComplete: () {
          requestedFocus.requestFocus();
        },
        style: const TextStyle(fontFamily: normsProSemiBold, fontSize: 18),
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          labelText: name,
          labelStyle: const TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 20),
          isDense: true,
          border: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
          disabledBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
          enabledBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
          focusedBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: kPrimaryColor, width: 2)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            width: Get.size.width,
            padding: const EdgeInsets.fromLTRB(20, 20, 15, 20),
            child: Text(
              "Haryt maglumatlary".tr,
              style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 22),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textField("Welayat sayla", controller, focusNode, focusNode1, 1),
                textField("Haryt ady", controller, focusNode, focusNode1, 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: PhoneNumber(mineFocus: focusNode1, controller: controller1, requestFocus: focusNode2),
                ),
                textField("Dusundiris", controller2, focusNode2, focusNode3, 5),
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 15),
                  child: Text(
                    "# Hashtag saylan",
                    style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 20),
                  ),
                ),
                AgreeButton(onTap: () {
                  // settingsController.incrementPageIndex();
                }),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
