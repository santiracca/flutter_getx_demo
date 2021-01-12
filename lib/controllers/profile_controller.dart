import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_demo/models/user.dart';

class ProfileController extends GetxController {
  User _user;

  User get user => _user;

  String _inputText = '';

  @override
  void onInit() {
    super.onInit();
    this._user = Get.arguments as User;
  }

  void onInputTextChanged(String text) {
    this._inputText = text;
  }

  void goToBackWithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: this._inputText);
    } else {
      Get.dialog(AlertDialog(
        title: Text("ERROR"),
        content: Text('Ingrese un valor valido'),
        actions: [
          FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Aceptar"))
        ],
      ));
    }
  }
}
