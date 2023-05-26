import 'package:flutter/material.dart';
import 'package:ecommerce/items/items_tile.dart';
import 'package:ecommerce/items/item_details.dart';

class ItemPage extends StatelessWidget {
  dynamic categorySelected;
  ItemPage({Key? key, required this.categorySelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorySelected)),
      body: ListView.builder(
      itemCount: ProductsList.itemsList.length,
      itemBuilder: (context, index) {
      return ItemsTile(
      item: ProductsList.itemsList[index]
      );
      }),
      );
  }
}

class CheckCategory
{
  static dynamic categoryCheck;

}