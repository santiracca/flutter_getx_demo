import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_demo/controllers/home_controller.dart';
import 'package:getx_demo/models/user.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'users',
        builder: (_) {
          if (_.loading)
            return Center(
              child: LinearProgressIndicator(),
            );
          return ListView.builder(
            itemCount: _.users.length,
            itemBuilder: (ctx, i) {
              final User user = _.users[i];
              return ListTile(
                title: Text(user.firstName),
                subtitle: Text(user.email),
                onTap: () => _.showUserProfile(user),
              );
            },
          );
        });
  }
}
