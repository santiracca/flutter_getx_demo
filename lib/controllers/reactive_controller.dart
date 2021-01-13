import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_demo/controllers/socket_client_controller.dart';
import 'package:getx_demo/models/pet.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;

  RxList<String> items = List<String>().obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;
  Pet myPet = Pet(name: "Lily", age: 8);

  StreamSubscription<String> _subscription;

  @override
  void onInit() {
    super.onInit();
    final socketController = Get.find<SocketClientController>();
    _subscription = socketController.message.listen((String data) {});
  }

  @override
  void onClose() {
    super.onClose();
    _subscription.cancel();
  }

  void increment() {
    counter.value++;
  }

  void addItem() {
    items.add(DateTime.now().toString());
  }

  void addMapItem() {
    final String key = DateTime.now().toString();
    mapItems.addAll({key: key});
  }

  void removeMapItem(String key) {
    mapItems.remove(key);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  void setPetAge(int newAge) {
    myPet.age = newAge;
  }
}
