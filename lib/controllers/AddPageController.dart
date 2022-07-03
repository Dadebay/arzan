import 'package:get/get.dart';

class AddPageController extends GetxController {
  RxInt selectedPageIndex = 0.obs;
  RxList imageArray = [].obs;
  dicrementPageIndex() {
    selectedPageIndex.value--;
  }

  incrementPageIndex() {
    selectedPageIndex.value++;
  }
}
