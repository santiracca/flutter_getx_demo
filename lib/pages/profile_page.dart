import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_demo/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        )),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${_.user.firstName} ${_.user.lastName}"),
              const SizedBox(height: 10),
              CupertinoTextField(
                onChanged: _.onInputTextChanged,
              ),
              const SizedBox(height: 10),
              CupertinoButton(
                  child: Text("Accept"), onPressed: _.goToBackWithData),
            ],
          ),
        ),
      ),
    );
  }
}
