import 'package:flutter/material.dart';
import 'package:ecommerce/items/items_tile.dart';


class ItemPage extends StatelessWidget {
  dynamic categorySelected;
  dynamic createCategory;
  ItemPage({Key? key, required this.categorySelected, required this.createCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorySelected)),
      body: ListView.builder(
      itemCount: createCategory.length,
      itemBuilder: (context, index) {
      return ItemsTile(
      item: createCategory[index]
      );
      }),
      );
  }
}
