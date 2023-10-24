import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'package:ecommerce/payment_configuration/payment_configurations.dart'as payment_configurations;




class PaymentController extends GetxController
{
  RxString paymentType = RxString("cashOnDelivery");
}

class Payment extends StatefulWidget{
  late var total;
  Payment({required this.total,super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  @override
  Widget build(BuildContext context) {
    final PaymentController payOption = Get.put(PaymentController());
    //final TextEditingController upiID = TextEditingController();
    //String paymentType = "cashOnDelivery";
    final upiSelected = UPISelect(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Address:",
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                  //backgroundColor: Colors.grey.shade200,
                  letterSpacing: 1,
                ),
                strutStyle: StrutStyle(height: 3),
              ),
              const Text("8/13 Andavar nagar",
                  style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w300
                  ),
                strutStyle: StrutStyle(height: 2),
                  ),
              Text("Amount to pay:${widget.total}"),
              Obx(() {
                return RadioListTile<String>(
                    title: const Text("Cash on Delivery"),
                    value: 'cashOnDelivery',
                    groupValue: payOption.paymentType.value,
                    onChanged: (value) {
                      /*setState(() {
                            payOption.paymentType = value!;
                          });*/
                      payOption.paymentType.value = value!;
                    });
              }),
               Obx(() {
                 return RadioListTile<String>(
                 title: const Text("UPI"),
                 value: 'upi',
                 groupValue: payOption.paymentType.value,
                 onChanged: (value) {
                 payOption.paymentType.value = value!;
                 });

                 /*setState(() {
                            payOption.paymentType = value!;
                          });*/
               }),
              /*Obx(() {
                if(payOption.paymentType.value == 'UPI')
                  {
                    return TextFormField(
                      controller: upiID,
                      decoration: const InputDecoration(
                        hintText: "Enter upi ID",
                      ),
                    );
                  }
                else
                  {
                    return const SizedBox.shrink();
                  }
              })*/
              //RadioMenuButton(value: value, groupValue: groupValue, onChanged: onChanged, child: child)
            Obx(()
              {
                return Padding(
                    padding: const EdgeInsets.all(20),
                    child: upiSelected.upiSelect(payOption.paymentType.value));
                  //upiSelected.upiSelect(payOption.paymentType.value);
              })
            ],
        ),
      ),
    );
  }
}
/*
Widget buildApplePayButton() {
  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }
  return ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(
        payment_configurations.defaultApplePay),
    paymentItems: _paymentItems,
    style: ApplePayButtonStyle.black,
    type: ApplePayButtonType.buy,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: onApplePayResult,
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );
}
*/

/*
Widget buildGooglePayButton() {
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }
  return GooglePayButton(
      paymentConfiguration: PaymentConfiguration.fromJsonString(
          payment_configurations.defaultGooglePay),
      paymentItems: _paymentItems,
      type: GooglePayButtonType.buy,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: onGooglePayResult,
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      )
  );
}
*/


class UPISelect extends GetxController
{
  BuildContext context;
  static const _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '1',
      status: PaymentItemStatus.final_price,
    )
  ];



  UPISelect(this.context);
  /*Widget paymentButton()
  {
    return Column(
      children: [
    GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(
    payment_configurations.defaultGooglePay),
    paymentItems: _paymentItems,
    type: GooglePayButtonType.buy,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: onGooglePayResult,
    loadingIndicator: const Center(
    child: CircularProgressIndicator(),
    )
    ),
    ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(
    payment_configurations.defaultApplePay),
    paymentItems: _paymentItems,
    style: ApplePayButtonStyle.black,
    type: ApplePayButtonType.buy,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: onApplePayResult,
    loadingIndicator: const Center(
    child: CircularProgressIndicator(),
    ),
    )
      ],
    );*/



  //final codConfirm = CODOrderPlaced();
  final TextEditingController upiID = TextEditingController();
  Container upiSelect(String payOption) {
    void onGooglePayResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }
    void onApplePayResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }
    if (payOption == 'upi')
    {
      return Container(
        width: double.maxFinite,
        height: 300,
        color: Colors.white30,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [TextFormField(
            controller: upiID,
            decoration: const InputDecoration(
              hintText: "Enter UPI ID",
            ),
          ),
      GooglePayButton(
          paymentConfiguration: PaymentConfiguration.fromJsonString(
              payment_configurations.defaultGooglePay),
          paymentItems: _paymentItems,
          type: GooglePayButtonType.buy,
          margin: const EdgeInsets.only(top: 15.0),
          onPaymentResult: onGooglePayResult,
          loadingIndicator: const Center(
            child: CircularProgressIndicator(),
          )
      ),
          ApplePayButton(
            paymentConfiguration: PaymentConfiguration.fromJsonString(
                payment_configurations.defaultApplePay),
            paymentItems: _paymentItems,
            style: ApplePayButtonStyle.black,
            type: ApplePayButtonType.buy,
            margin: const EdgeInsets.only(top: 15.0),
            onPaymentResult: onApplePayResult,
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        /*const Image(image: AssetImage("images/GPay_Acceptance_Mark_800.png"),
                  height: 100,
                    width: 100,*/
          ]
        ),
      );
    }
    else
      {
        return Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
          ),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()async
              {
                await ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Order placed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  backgroundColor: Colors.green,
                ));

                //codConfirm.codOrderPlacedConfirmation(context);
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  elevation: MaterialStatePropertyAll(5)
              ),
              child: const Text(
                "Place Order",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )]
          )
        );
      }
  }
}

/*class CODOrderPlaced
{
  ScaffoldFeatureController codOrderPlacedConfirmation(BuildContext context)
  {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Order placed",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      backgroundColor: Colors.green,
    ));
  }

}*/

/*
class UPIIDPayment
{
  static const _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];
  UPIIDPayment()
  {

  }

  static void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

*/
/*final get_connect = GetConnect();
    Future makePayment(String currencyCode, double total, String upiId) async {
      // Create a payment request.
      Map<String, dynamic> paymentRequest = {
        'currencyCode': 'INR',
        'total': 1.00,
        'upiId': 'upiid@example.com',
      };

      // Make a POST request to the Google Pay API.
      Response response = await get_connect.post(
        'https://pay.google.com/api/v1/payments',
        jsonEncode(paymentRequest),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      try {
        // Parse the response.
        Map<String, dynamic> responseData = jsonDecode(response.body);

        // Check if the payment was successful.
        if (responseData['status'] == 'success') {
          print("Payment success");
          //return PaymentResult.success();
        } else {
          print("Payment not successful");
          //return PaymentResult.error(responseData['error']);
        }
      }
      catch(error)
      {
        print(error);
      }
    }*//*

//PaymentResult paymentResult = await makePayment('INR', 10.00, '9840801041@ybl');
// Create a payment request with the UPI ID of the recipient.
*/
/*PaymentRequest paymentRequest = await Pay.createPaymentRequest(
  currencyCode: 'INR',
  upiId: '9840801041@ybl',
  );
  bool canPay = await Pay.userCanPay(PayProvider.google_pay);
  if (canPay) {
  PaymentResult paymentResult = await Pay.showPaymentSheet(paymentRequest);

  // Process the payment result and send the payment token to your backend server to complete the transaction.
  if (paymentResult.status == PaymentStatus.success) {
  print("payment success");
  } else {
  // The payment failed.
  print("payment failed");
  }
  }
  else
  {
  print("please install app");
  }*//*

}
*/
