class CheckoutPageDetails
{
  String checkoutProductImage = '';
  late double checkoutProductPrice;
  String checkoutProductCode = "";
  static List checkoutList =[];
  CheckoutPageDetails({required this.checkoutProductCode, required this.checkoutProductImage, required this.checkoutProductPrice})
  {
    List checkoutItemDetailsList = [];
    //List priceList = [];
    checkoutItemDetailsList.add(checkoutProductCode);
    checkoutItemDetailsList.add(checkoutProductImage);
    checkoutItemDetailsList.add(checkoutProductPrice);
    checkoutList.add(List.from(checkoutItemDetailsList));
    /*priceList.add(List.from(checkoutItemDetailsList[0]));
    priceList.add(List.from(checkoutItemDetailsList[2]));*/
    checkoutItemDetailsList.clear();
  }
}
class CheckoutPrice
{
  late int count;
  late double price;
  static List priceList = [];
  late int priceListChangeTracker;
  CheckoutPrice({required this.count, required this.price})
  {
    List priceListUpdate = [];
    priceListUpdate.add(count);
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

class Subtotal {
  static double subTotal = 0;
  Subtotal({required int priceListCurrentIndex, required List priceList}) {
    for (int i = priceListCurrentIndex; i < priceList.length; i++) {
       subTotal = subTotal + priceList[i][0]*priceList[i][1];
    }
  }
}
