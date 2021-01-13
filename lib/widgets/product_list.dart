import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_demo/controllers/global_controller.dart';
import 'package:getx_demo/models/product.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
        id: 'products',
        builder: (_) {
          return ListView.builder(
            itemBuilder: (ctx, i) {
              final Product product = _.products[i];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('USD ${product.price}'),
                trailing: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: product.isFavorite ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    _.onFavorite(i, !product.isFavorite);
                  },
                ),
              );
            },
            itemCount: _.products.length,
          );
        });
  }
}
