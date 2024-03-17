import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 2.obs;
  void selectIndex(index) {
    selectedIndex.value = index;
    notifyChildrens();
  }
}