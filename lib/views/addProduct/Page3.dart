// ignore_for_file: file_names

import 'package:arzan/controllers/AddPageController.dart';
import 'package:arzan/views/others/index.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final AddPageController addPageController = Get.put(AddPageController());
  TextEditingController descriptionController = TextEditingController();
  FocusNode descriptionFocusNode = FocusNode();
  TextEditingController priceController = TextEditingController();
  FocusNode priceFocusNode = FocusNode();
  TextEditingController instagramController = TextEditingController();
  FocusNode instagramFocusNode = FocusNode();
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode phoneNumberFocusNode = FocusNode();
  TextEditingController productNameController = TextEditingController();
  FocusNode productNameFocusNode = FocusNode();
  TextEditingController websiteController = TextEditingController();
  FocusNode websiteFocusNode = FocusNode();
  TextEditingController welayatController = TextEditingController();
  FocusNode welayatFocusNode = FocusNode();

  int? _dostawkaBar = 1;

  Widget textField(String name, TextEditingController controllerrr, FocusNode focusNodeee, FocusNode requestedFocus, int maxline) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: TextFormField(
        cursorColor: Colors.black,
        cursorHeight: 23,
        focusNode: focusNodeee,
        controller: controllerrr,
        maxLines: maxline,
        enableSuggestions: false,
        autocorrect: false,
        onTap: () {},
        onEditingComplete: () {
          requestedFocus.requestFocus();
        },
        style: const TextStyle(fontFamily: normsProSemiBold, fontSize: 18),
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: name,
          labelStyle: const TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 18),
          isDense: true,
          border: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
          disabledBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
          enabledBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
          focusedBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: kPrimaryColor, width: 2)),
        ),
      ),
    );
  }

  TextField selectWelayat() {
    return TextField(
      cursorColor: Colors.black,
      cursorHeight: 23,
      focusNode: welayatFocusNode,
      controller: welayatController,
      readOnly: true,
      onTap: () {
        Get.defaultDialog(
            barrierDismissible: true,
            title: "selectCityTitle".tr,
            titleStyle: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold),
            radius: 5,
            titlePadding: const EdgeInsets.symmetric(vertical: 14),
            contentPadding: const EdgeInsets.only(),
            content: Column(
              children: [
                customDivider(),
                button(0),
                customDivider(),
                button(1),
                customDivider(),
                button(2),
                customDivider(),
                button(3),
                customDivider(),
                button(4),
                customDivider(),
                button(5),
                customDivider(),
                button(6),
              ],
            ));
      },
      style: const TextStyle(fontFamily: normsProSemiBold, fontSize: 18),
      decoration: InputDecoration(
        fillColor: backgroundColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        labelText: "selectCityTitle".tr,
        labelStyle: const TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 18),
        isDense: true,
        suffixIcon: const Icon(IconlyLight.arrowDownCircle),
        border: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
        disabledBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
        enabledBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: backgroundColor)),
        focusedBorder: const OutlineInputBorder(borderRadius: borderRadius10, borderSide: BorderSide(color: kPrimaryColor, width: 2)),
      ),
    );
  }

  TextButton button(int id) {
    return TextButton(
      onPressed: () {
        welayatController.text = "${welayat[id]}".tr;
        Get.back();
      },
      child: Text(
        "${welayat[id]}".tr,
        style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 16),
      ),
    );
  }

  Widget _myRadioButton({
    required String title,
    required int value,
  }) {
    return RadioListTile(
      value: value,
      groupValue: _dostawkaBar,
      activeColor: kPrimaryColor,
      onChanged: (a) {
        _dostawkaBar = a as int?;
        setState(() {});
      },
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontFamily: _dostawkaBar == value ? normsProSemiBold : normsProMedium, fontSize: 18),
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
            padding: const EdgeInsets.fromLTRB(20, 20, 15, 15),
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
                selectWelayat(),
                textField("Haryt ady", productNameController, productNameFocusNode, priceFocusNode, 1),
                textField("Haryt bahasy", priceController, priceFocusNode, phoneNumberFocusNode, 1),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: PhoneNumber(
                    mineFocus: phoneNumberFocusNode,
                    controller: phoneNumberController,
                    requestFocus: instagramFocusNode,
                    style: true,
                  ),
                ),
                textField("Instagram", instagramController, instagramFocusNode, websiteFocusNode, 1),
                textField("Web Sahypa", websiteController, websiteFocusNode, descriptionFocusNode, 1),
                textField("Dusundiris", descriptionController, descriptionFocusNode, descriptionFocusNode, 5),
                const Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                  child: Text(
                    "Dostawka :",
                    style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 20),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: _myRadioButton(
                        title: "Bar",
                        value: 0,
                      ),
                    ),
                    Expanded(
                      child: _myRadioButton(
                        title: "Yok",
                        value: 1,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: backgroundColor,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 150,
                  child: const Center(child: Text("Hastag Field")),
                ),
                AgreeButton(onTap: () {
                  addPageController.incrementPageIndex();
                }),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
