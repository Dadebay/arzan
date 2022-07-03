import 'package:arzan/views/others/index.dart';
import 'package:arzan/controllers/SettingsController.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  bool showText = true;
  final _login = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: const MyAppBar(
          backArrow: true,
          iconRemove: true,
          elevation: 1,
          name: "aboutUs",
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: _login,
            child: AnimatedCrossFade(
              crossFadeState: showText ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 500),
              firstChild: page2(),
              secondChild: page1(),
            ),
          ),
        ));
  }

  Column page1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 8),
          child: Text(
            "contactInformation".tr,
            style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 20),
          ),
        ),
        simpleButton(icon: IconlyBold.call, name: "+993-62-99-03-44"),
        simpleButton(icon: IconlyBold.message, name: "loremimpsum@gmail.com"),
        simpleButton(icon: IconlyBold.location, name: "Ashgabat ş. Balshere kafe yanyndaky Medeniyeet  you can find us Google maps "),
        Padding(
          padding: const EdgeInsets.only(top: 35, bottom: 8),
          child: Text(
            "creators".tr,
            style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 20),
          ),
        ),
        Text(
          " - Ideal firmasy".tr,
          style: const TextStyle(color: Colors.black, fontFamily: normsProMedium, fontSize: 18),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            " - Gurbanow Dädebaý".tr,
            style: const TextStyle(color: Colors.black, fontFamily: normsProMedium, fontSize: 18),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30, bottom: 15),
          width: Get.size.width,
          child: RaisedButton(
            onPressed: () {
              setState(() {
                showText = !showText;
              });
            },
            color: backgroundColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: const RoundedRectangleBorder(
              borderRadius: borderRadius20,
            ),
            child: Text(
              "sendText".tr,
              style: const TextStyle(color: kPrimaryColor, fontFamily: normsProBold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  ListTile simpleButton({required IconData icon, required String name}) {
    return ListTile(
      dense: true,
      onTap: () {},
      minLeadingWidth: 10,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
      shape: const RoundedRectangleBorder(borderRadius: borderRadius5),
      leading: Icon(
        icon,
        color: kPrimaryColor,
      ),
      title: Text(
        name,
        textAlign: TextAlign.start,
        style: const TextStyle(fontFamily: normsProMedium, fontSize: 18, color: Colors.black),
      ),
    );
  }

  Column page2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Text(
            "contactInformationSubtitle".tr,
            style: const TextStyle(color: Colors.black87, fontFamily: normsProMedium, fontSize: 18),
          ),
        ),
        CustomTextField(
          labelName: "fullName",
          borderRadius: true,
          controller: nameController,
          focusNode: nameFocusNode,
          requestfocusNode: phoneFocusNode,
          isNumber: false,
        ),
        PhoneNumber(mineFocus: phoneFocusNode, controller: phoneController, requestFocus: emailFocusNode),
        CustomTextField(
          borderRadius: true,
          labelName: "email",
          controller: emailController,
          focusNode: emailFocusNode,
          requestfocusNode: messageFocusNode,
          isNumber: false,
        ),
        CustomTextField(
          maxline: 4,
          borderRadius: true,
          labelName: "message",
          controller: messageController,
          focusNode: messageFocusNode,
          requestfocusNode: nameFocusNode,
          isNumber: false,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: AgreeButton(
            onTap: () {
              if (_login.currentState!.validate()) {
                Get.find<SettingsController>().agreeButton.value = !Get.find<SettingsController>().agreeButton.value;
              }
            },
          ),
        ),
      ],
    );
  }
}
