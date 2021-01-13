import 'package:get/get.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;

  RxList<String> items = List<String>().obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;

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
}
