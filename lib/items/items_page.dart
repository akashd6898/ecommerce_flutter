import 'package:ecommerce/product_view/product_page.dart';
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
      return GestureDetector(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductPage(productDetails: createCategory[index])));
        },
        child: ItemsTile(
        item: createCategory[index]
        ),
      );
      }),
      );
  }
}
