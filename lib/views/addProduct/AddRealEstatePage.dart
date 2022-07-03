import 'package:arzan/controllers/AddPageController.dart';
import 'package:arzan/views/others/index.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'Page3.dart';
import 'Page4.dart';
import 'Page5.dart';

class AddProductPage extends StatelessWidget {
  final AddPageController addPageController = Get.put(AddPageController());
  List page = [
    const Page3(),
    const Page4(),
    const Page5(),
  ];

  Widget progressIndicator() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
      child: StepProgressIndicator(
        totalSteps: page.length,
        currentStep: addPageController.selectedPageIndex.value + 1,
        size: 8,
        customStep: (index, color, size) {
          return Container(
            width: 25,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(borderRadius: borderRadius5, color: color),
          );
        },
        selectedColor: const Color.fromARGB(255, 52, 194, 57),
        unselectedColor: Colors.grey.shade300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Add Product".tr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 20),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: addPageController.selectedPageIndex.value != 2
                ? IconButton(
                    onPressed: () {
                      if (addPageController.selectedPageIndex.value > 0) {
                        addPageController.dicrementPageIndex();
                      } else {
                        Get.back();
                      }
                    },
                    icon: const Icon(
                      IconlyLight.arrowLeftCircle,
                      color: Colors.black,
                    ))
                : const SizedBox.shrink(),
          ),
          body: Column(
            children: [progressIndicator(), Expanded(child: page[addPageController.selectedPageIndex.value] as Widget)],
          ));
    });
  }
}
