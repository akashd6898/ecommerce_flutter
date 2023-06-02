import 'package:flutter/material.dart';
import 'package:ecommerce/items/item_details.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
            child: PageView.builder(itemCount: PhoneList.itemsList[0].imageSet?.length,
                itemBuilder: (context,index)
            {
              return Image(image: NetworkImage(PhoneList.itemsList[0].imageSet![index]),
                  fit: BoxFit.fill,
                  width: 300,
                  height: 200,);
            }),
          ),
          Text(PhoneList.itemsList[0].description),
        ],
      ),
    );
  }
}

