import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_demo/controllers/reactive_controller.dart';

class ReactivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) {
        print("reactive");
        return Scaffold(
          body: Obx(
            () => ListView(
              children: _.mapItems.values
                  .map((e) => ListTile(
                      title: Text(e),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _.removeMapItem(e))))
                  .toList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                _.addMapItem();
              },
              child: Text("Add")),
        );
      },
    );
  }
}
