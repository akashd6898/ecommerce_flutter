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
                  height: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: [
                      SliverList(delegate: SliverChildBuilderDelegate((context, index) =>
                          Padding(
                            padding:const EdgeInsets.all(5),
                            child: Container(
                            width: 250,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 3),
                              )]
                            ),
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
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    //gradient: LinearGradient(colors: [Colors.white70, Colors.lightBlueAccent])
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [const Text("Order Summary",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Sub-Total:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        strutStyle: StrutStyle(
                          height: 3
                        ),),
                          Text("1000",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                            strutStyle: StrutStyle(
                                height: 3
                            ),)
                      ]),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Tax:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            )),
                          Text("1000",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                            strutStyle: StrutStyle(
                                height: 3
                            ),)
                        ]
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Delivery charge:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            )),
                          Text("1000",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                            strutStyle: StrutStyle(
                                height: 3
                            ),)
                        ]
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Total:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          strutStyle: StrutStyle(
                            height: 3,
                          ),
                        ),
                          Text("1000",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                            strutStyle: StrutStyle(
                                height: 3
                            ),)
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadiusDirectional.all(Radius.circular(7)),
                            gradient: LinearGradient(colors: [Colors.cyanAccent,Colors.lightBlueAccent, Colors.blue]),
                            boxShadow: [BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 3)
                            )]
                          ),
                          child: const Text(
                            "Pay",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],)
                    ],
                  ),
                )
              ],
          )
      ),
    );
  }
}
