import 'dart:async';
import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SocketClientController extends GetxController {
  RxString _message = "".obs;
  RxString _searchText = "".obs;
  RxString get message => _message;

  Timer _timer, _timerCounter;

  final _faker = Faker();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() {
    // ever(_counter, (_) {
    //   print("_counter has been changed ${_counter.value}");
    // });

    debounce(_searchText, (_) {
      print(_searchText.value);
    }, time: Duration(milliseconds: 500));

    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _message.value = _faker.lorem.sentence();
    });
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer.cancel();
    }

    super.onClose();
  }

  void setSearchText(String val) {
    _searchText.value = val;
  }
}
