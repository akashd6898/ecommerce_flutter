import 'package:flutter/foundation.dart';


class CheckoutPageDetails
{
  String checkoutProductModel = '';
  String checkoutProductImage = '';
  late double checkoutProductPrice;
  String checkoutProductCode = "";
  static List checkoutList =[];
  //late List priceList = [];
  //final obj = Price();
  CheckoutPageDetails({required this.checkoutProductCode,required this.checkoutProductImage, required this.checkoutProductModel , required this.checkoutProductPrice})
  {
    List checkoutItemDetailsList = [];
    checkoutItemDetailsList.add(checkoutProductCode);
    checkoutItemDetailsList.add(checkoutProductImage);
    checkoutItemDetailsList.add(checkoutProductModel);
    checkoutItemDetailsList.add(checkoutProductPrice);
    //priceList.add(checkoutProductPrice);
    checkoutList.add(List.from(checkoutItemDetailsList));
    //obj.subtotal(priceList);
    checkoutItemDetailsList.clear();
  }
  static checkoutDel({required checkoutProductCode})
  {
    for(int i = 0; i< checkoutList.length; i++)
      {
        if(checkoutProductCode == checkoutList[i][0])
          {
            checkoutList.removeAt(i);
            break;
          }
      }
  }
}

class Price extends ChangeNotifier
{
  late double tax = 0;
  late double deliveryCharge = 0;
  late double total = 0;
  late double subTotal = 0;
  static List priceList = [];
  priceAdd(var priceAdd)
  {
    priceList.add(priceAdd);
    subtotal(priceList);
    notifyListeners();
  }
  priceDel(var priceDel)
  {
    priceList.remove(priceDel);
    subtotal(priceList);
    notifyListeners();
  }
  subtotal(var priceList){
  subTotal = 0;
  for (int i = 0; i < priceList.length; i++){
  subTotal = subTotal + priceList[i];
  /*deliveryChargeCal(subTotal);
  totalCal(subTotal);*/
  }
  taxDeliveryCal(subTotal);
  notifyListeners();
  }
  taxDeliveryCal(var subTotal)
  {
    tax = 0;
    deliveryCharge = 0;
    tax = this.subTotal*0.05;
    deliveryCharge = this.subTotal*0.02;
    totalCal(this.subTotal, tax, deliveryCharge);
    notifyListeners();
  }
  /*deliveryChargeCal(var subTotal)
  {
    double deliveryCharge = 0;
    deliveryCharge = subTotal*0.02;
  }*/
  totalCal(var subTotal, double tax, double deliveryCharge)
  {
    total = 0;
    total = subTotal + this.tax + this.deliveryCharge;
  }
}



/*
class CheckoutPrice
{
  late double price;
  static List priceList = [];
  late int priceListChangeTracker;
  CheckoutPrice({required this.price})
  {
    List priceListUpdate = [];
    priceListUpdate.add(price);
    priceListChangeTracker = priceList.length;
    priceList.add(List.from(priceListUpdate));
    priceListUpdate.clear();
    if(priceList.length != priceListChangeTracker){
      Subtotal(priceListCurrentIndex: priceListChangeTracker,priceList: priceList);
    }
    priceListChangeTracker = priceList.length;
  }
}

class PriceDelete {
  double priceDel;

  PriceDelete({required this.priceDel}) {
    CheckoutPrice.priceList.remove(priceDel);
  }
}


class Subtotal {
  static double subTotal = 0;
  Subtotal({required int priceListCurrentIndex, required List priceList}) {
    for (int i = priceListCurrentIndex; i < priceList.length; i++) {
       subTotal = subTotal + priceList[i][0];
       OrderSummary();
    }
  }
}
class OrderSummary
{
  static double tax = 0;
  static double deliveryCharge = 0;
  static double total = 0;
  OrderSummary()
  {
    tax = Subtotal.subTotal*0.05;
    deliveryCharge = Subtotal.subTotal*0.02;
    total = Subtotal.subTotal + tax + deliveryCharge;
  }
}

class CheckoutDelete {
  String checkoutDelProductCode = "";

  CheckoutDelete({required this.checkoutDelProductCode}) {
    for (int i = 0; i < CheckoutPageDetails.checkoutList.length; i++) {
      if (CheckoutPageDetails.checkoutList[i][0].contains(
          checkoutDelProductCode))
      {
        CheckoutPageDetails.checkoutList.removeAt(i);
        break;
      }
    }
  }
}*/
