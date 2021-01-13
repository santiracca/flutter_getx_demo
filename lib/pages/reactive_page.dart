import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_demo/controllers/reactive_controller.dart';
import 'package:getx_demo/controllers/socket_client_controller.dart';

class ReactivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketController = Get.find<SocketClientController>();
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) {
        print("reactive");
        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoTextField(onChanged: (text) {
              socketController.setSearchText(text);
            }),
            // Obx(() => Text("Age: ${_.myPet.age}")),
            Obx(() => Text(socketController.message.value)),
            FlatButton(
                onPressed: () {
                  _.setPetAge(_.myPet.age + 1);
                },
                child: Text("set age"))
          ],
        )
            // body: Obx(
            //   () => ListView(
            //     children: _.mapItems.values
            //         .map((e) => ListTile(
            //             title: Text(e),
            //             trailing: IconButton(
            //                 icon: Icon(Icons.delete),
            //                 onPressed: () => _.removeMapItem(e))))
            //         .toList(),
            //   ),
            // ),
            // floatingActionButton: FloatingActionButton(
            //     onPressed: () {
            //       _.addMapItem();
            //     },
            //     child: Text("Add")),
            );
      },
    );
  }
}
