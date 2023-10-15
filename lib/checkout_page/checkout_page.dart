import 'package:ecommerce/payment/payment_page.dart';
import "package:flutter/material.dart";
import 'package:ecommerce/checkout_page/checkout_page_details.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    final priceObj = Provider.of<Price>(context);
          return Scaffold(
            appBar: AppBar(
              shape: const RoundedRectangleBorder(side: BorderSide(
                  color: Colors.lightBlue,
                  width: 2.0,
                  strokeAlign: 2.0,
                  style: BorderStyle.solid
              ),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(50), right: Radius.circular(50))
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
                        child: CheckoutPageDetails.checkoutList.isNotEmpty ?
                        CustomScrollView(
                          scrollDirection: Axis.vertical,
                          slivers: [
                            SliverList(
                                delegate: SliverChildBuilderDelegate((context,
                                    index) {
                                  final item = CheckoutPageDetails
                                      .checkoutList[index];
                                  //Subtotal();
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      width: 250,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: const Offset(0, 3),
                                          )
                                          ]
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image(image: NetworkImage(
                                              item[1]),
                                              width: 50,
                                              height: 70),
                                          Text("${item[2]}",
                                            style:const TextStyle(
                                              fontSize: 12.0
                                            ),
                                          ),
                                          Text("₹${item[3]}"),
                                          IconButton(
                                            onPressed: () {
                                              CheckoutPageDetails(checkoutProductCode: item[0],
                                                  checkoutProductImage: item[1],
                                                  checkoutProductModel: item[2],
                                                  checkoutProductPrice: item[3]);
                                              priceObj.priceAdd(item[3]);
                                            },
                                            icon: const Icon(Icons.add,
                                              color: Colors.green,),
                                          ),
                                          IconButton(
                                            onPressed: ()
                                            {
                                              CheckoutPageDetails.checkoutDel(checkoutProductCode: item[0]);
                                              priceObj.priceDel(item[3]);
                                            },
                                            icon: const Icon(
                                                Icons.highlight_remove_sharp,
                                                color: Colors.red),
                                          )
                                        ],
                                      ),
                                    ),);
                                },
                                    childCount: CheckoutPageDetails.checkoutList
                                        .length)
                            )
                          ],
                        ) :
                        const Image(image: NetworkImage("https://media.istockphoto.com/id/861576608/vector/empty-shopping-bag-icon-online-business-vector-icon-template.jpg?s=612x612&w=0&k=20&c=I7MbHHcjhRH4Dy0NVpf4ZN4gn8FVDnwn99YdRW2x5k0="))
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [const Text("Sub-Total:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                                strutStyle: StrutStyle(
                                    height: 3
                                ),),
                                Text("₹${priceObj.subTotal}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                  strutStyle: const StrutStyle(
                                      height: 3
                                  ),)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [const Text("Tax:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  )),
                                Text("₹${(priceObj.tax)}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                  strutStyle: const StrutStyle(
                                      height: 3
                                  ),)
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [const Text("Delivery charge:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  )),
                                Text("₹${(priceObj.deliveryCharge)}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                  strutStyle: const StrutStyle(
                                      height: 3
                                  ),)
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [const Text("Total:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                                strutStyle: StrutStyle(
                                  height: 3,
                                ),
                              ),
                                Text("₹${(priceObj.total)}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                  strutStyle: const StrutStyle(
                                      height: 3
                                  ),)
                              ]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: ()
                                {
                                  if(priceObj.total != 0)
                                    {
                                      Get.to(() => Payment(total: priceObj.total));
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: const Text("Cart is empty, Add items to proceed",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        ),
                                        backgroundColor: Colors.red[400],
                                      ));
                                    }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadiusDirectional.all(
                                          Radius.circular(7)),
                                      gradient: LinearGradient(colors: [
                                        Colors.cyanAccent,
                                        Colors.lightBlueAccent,
                                        Colors.blue
                                      ]),
                                      boxShadow: [BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 3)
                                      )
                                      ]
                                  ),
                                  child: const Text(
                                    "Pay",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],)
                        ],
                      ),
                    )
                  ],
                )
            )
        );
  }
}
