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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Brand: ${PhoneList.itemsList[0].brand}",
            style: const TextStyle(
              fontSize: 15,
            ),
            ),
            Text("Model: ${PhoneList.itemsList[0].model}"),
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
            Text("Price: ₹${PhoneList.itemsList[0].price}"),
            Text(PhoneList.itemsList[0].description),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                ElevatedButton(onPressed: null,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue
                        ),
                      fixedSize: MaterialStateProperty.all<Size>(const Size(150, 50)),
                      elevation: MaterialStateProperty.all(5)
                    ),
                    child:
                        const Icon(
                        Icons.add_shopping_cart,
                            color: Colors.white
                        )),
                 ElevatedButton(onPressed: null,
                     style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(
                             Colors.blue
                         ),
                         fixedSize: MaterialStateProperty.all<Size>(const Size(150, 50)),
                         elevation: MaterialStateProperty.all(5)
                     ),
                     child:
                     const Icon(
                         Icons.favorite,
                         color: Colors.white
                     ))]
             )],
            ),
      )
      );
  }
}

