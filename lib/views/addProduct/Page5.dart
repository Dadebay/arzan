// ignore_for_file: deprecated_member_use, file_names

import 'package:arzan/controllers/SettingsController.dart';
import 'package:arzan/views/BottomNavBar.dart';
import 'package:arzan/views/others/index.dart';
import 'package:lottie/lottie.dart';

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> with TickerProviderStateMixin {
  final SettingsController settingsController = Get.put(SettingsController());

  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    done,
                    animate: true,
                    controller: _controller,
                    onLoaded: (composition) {
                      _controller
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: Text(
                      "Maglumatlaryňyz ugradyldy.\nGaraşmagyňyzy haýyş edýäris.".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: normsProSemiBold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: AgreeButton(onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                        return const BottomNavBar();
                      }));
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
