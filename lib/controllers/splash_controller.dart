import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_demo/pages/home_page.dart';

class SplashController extends GetxController {
  bool isLoading = true;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      Get.off(HomePage(), transition: Transition.zoom);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
