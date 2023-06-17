import "package:ecommerce/items/item_details.dart";
import "package:flutter/material.dart";

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(side: BorderSide(
          color: Colors.lightBlue,
          width: 2.0,
          strokeAlign: 2.0,
          style: BorderStyle.solid
        ),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(50), right: Radius.circular(50))
        ),
        elevation: 10.0,
        title: const Text("Checkout"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  width: 350,
                  height: 450,
                  color: Colors.white70,
                  child: CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: [
                      SliverList(delegate: SliverChildBuilderDelegate((context, index) =>
                          Padding(
                            padding:const EdgeInsets.all(5),
                            child: Container(
                            width: 250,
                            height: 80,
                            color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image(image: NetworkImage(PhoneList.itemsList[0].image),
                                      width: 50,
                                      height: 70),
                                  Text("₹${PhoneList.itemsList[0].price.toString()}"),
                                  const Text("Count: 1"),
                                  const IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.add,
                                      color: Colors.green,),
                                  ),
                                  const IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.highlight_remove_sharp,
                                      color: Colors.red,),
                                  )
                                ],
                            ),
                      ),),
                      childCount: 10)
                      )
                    ],
                  )
                )
          ])
      )
    );
  }
}
