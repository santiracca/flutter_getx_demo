import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_demo/controllers/global_controller.dart';
import 'package:getx_demo/controllers/home_controller.dart';

import 'package:getx_demo/widgets/product_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              GetBuilder<GlobalController>(
                id: 'favorites',
                builder: (_) => FlatButton(
                    onPressed: () {},
                    child: Text("Favoritos (${_.favorites.length})")),
              )
            ],
          ),
          body: ProductList(),
          floatingActionButton: FloatingActionButton(
            onPressed: _.increment,
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
