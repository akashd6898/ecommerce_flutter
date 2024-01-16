import 'package:flutter/material.dart';
import 'package:ecommerce/checkout_page/checkout_page_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {

  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final db = FirebaseFirestore.instance;

  final orderPageObj = OrderPageDetails(paymentType: "COD");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: orderPageObj.orderPageSetup(),
    builder: (context, snapshot) {
    if (snapshot.hasError) {
    print('Error: ${snapshot.error}');
    return Text('Error: ${snapshot.error}');
    }
    else if (snapshot.hasData) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Orders"),
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
        child: Container(
          height: 500,
          width: 400,
          color: Colors.red,
          child:
            ListView.builder(itemCount: orderPageObj.itemCount.length,
              itemBuilder: (context, index) {
              print("index in list view builder $index");
                return Container(
                  alignment: Alignment.center,
                  height: 75,
                  width: 100,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(image: NetworkImage(
                          orderPageObj.orderImageList[index]),
                        //NetworkImage("https://img.freepik.com/free-vector/colorful-bird-illustration-gradient_343694-1741.jpg?w=1380&t=st=1704005795~exp=1704006395~hmac=a15a230bd9978877b731d02292aa537532c02d04eee71a8b72a2e479cbd222b4"),
                        width: 50,
                        height: 40,
                      ),
                      Text(orderPageObj.orderModelList[index]),
                      Text(orderPageObj.orderPriceList[index].toString()),
                      const Text("d/m/y"),
                      const Text('order ID')
                    ],
                  ),
                );
              },),
        )
    ));
    }
    else {
      return const Center(child: CircularProgressIndicator());
    }});
  }
}

class OrderPageDetails //extends GetxController
{
  FirebaseAuth auth = FirebaseAuth.instance;
  late String uid;
  late String paymentType;
  List<String> ordersItemCodeList = [];
  List<String> ordersItemBrand = [];
  List<String> orderImageList = [];
  List<String> orderModelList = [];
  List<double> orderPriceList = [];
  List<dynamic> itemCount = [];
  //static RxList<dynamic> itemCount = RxList([]).obs();
  static List<String> itemBrands = [];
  final db = FirebaseFirestore.instance;
  //late Future<QuerySnapshot> querySnapshot;
  late QueryDocumentSnapshot orderDoc;
  OrderPageDetails({required this.paymentType});
  orderPageSetup() async
  {
    uid = auth.currentUser!.uid;
    final CollectionReference orderRef = db.collection('orders');
    QuerySnapshot querySnapshot = await orderRef.where('userid', isEqualTo: uid).get();
        if (querySnapshot.docs.isNotEmpty) {
          orderDoc = querySnapshot.docs[0];
          print("in if block orderpage setup");
          List<dynamic> existingOrderItems = (await orderDoc.get('order items')) ?? [];
          List<dynamic> existingOrderBrands = (await orderDoc.get('order brand')) ?? [];

          // Combine existing and new elements, preserving duplicates:
          List<dynamic> updatedOrderItems = [...existingOrderItems, ...ordersItemCodeList];
          List<dynamic> updatedOrderBrands = [...existingOrderBrands, ...ordersItemBrand];

          //await orderDoc.reference. update({'order items': FieldValue.arrayUnion(ordersItemCodeList)});
          //await orderDoc.reference.update({'order brand': FieldValue.arrayUnion(ordersItemBrand)});
          await orderDoc.reference.update({'order items': updatedOrderItems});
          await orderDoc.reference.update({'order brand': updatedOrderBrands});
          print("order Document : $orderDoc");
        }
        else {
          await db.collection("orders").add(ordersToJSON());
          print("item list added to DB");
          querySnapshot = await orderRef.where('userid', isEqualTo: uid).get();
          orderDoc = querySnapshot.docs[0];
        }
        itemCount = await List.from(orderDoc.get('order items'));
        itemBrands = await List.from(orderDoc.get('order brand'));
        print("item count $itemCount");
        for (int index = 0; index < itemCount.length; index++ )
          {
            print("Index in for loop $index");
            DocumentReference orderItemRef = await db.collection(itemBrands[index]).doc(itemCount[index]);
            DocumentSnapshot orderProperties = await orderItemRef.get();
            print("Doc ID in for loop: $orderItemRef");
            print("Doc image in for loop $index: ${orderProperties.get('image')}");
            orderImageList.add(orderProperties.get("image"));
            orderModelList.add(orderProperties.get("model"));
            orderPriceList.add(double.parse(orderProperties.get("price")));
            print(orderImageList[index]);
            print(orderModelList[index]);
            print(orderPriceList[index]);
          }
        return orderDoc;

    //bool addressDocFlag = querySnapshot.docs.isNotEmpty;

  }

  ordersItemCodes()
  {
    for(int i = 0; i < CheckoutPageDetails.checkoutList.length; i++)
    {
      ordersItemCodeList.add(CheckoutPageDetails.checkoutList[i][0]);
      print("Item code ${CheckoutPageDetails.checkoutList[i][0]}");
      ordersItemBrand.add(CheckoutPageDetails.checkoutList[i][4]);
      print("Item Brand ${CheckoutPageDetails.checkoutList[i][4]}");
    }
  }
  ordersToJSON()
  {
    return
        {
          "userid" : uid,
          "payment type" : paymentType,
          "order items" : ordersItemCodeList,
          "order brand" : ordersItemBrand
        };
  }
}