import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_demo/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        dispose: (_) {
          print("normal dispose");
        },
        init: SplashController(),
        builder: (_) => Scaffold(
              appBar: AppBar(),
              body: Center(child: CircularProgressIndicator()),
            ));
  }
}
