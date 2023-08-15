
import 'package:flutter/foundation.dart';

class FavouritePageDetails {
  String favouriteProductModel = '';
  String favouriteProductImage = '';
  late double favouriteProductPrice;
  String favouriteProductCode = "";
  String favouriteProductDescription = "";
  static List favouriteList = [];

  FavouritePageDetails(
      {required this.favouriteProductCode, required this.favouriteProductImage, required this.favouriteProductModel, required this.favouriteProductPrice, required this.favouriteProductDescription}) {
    int count = 0;
    for(int i = 0; i < favouriteList.length; i++) {
      if (favouriteList[i][0].contains(favouriteProductCode)) {
        ++count;
        break;
      }
    }
       if(count != 1 || favouriteList.isEmpty){
        List favouriteItemDetailsList = [];
        favouriteItemDetailsList.add(favouriteProductCode);
        favouriteItemDetailsList.add(favouriteProductImage);
        favouriteItemDetailsList.add(favouriteProductModel);
        favouriteItemDetailsList.add(favouriteProductPrice);
        favouriteItemDetailsList.add(favouriteProductDescription);
        favouriteList.add(List.from(favouriteItemDetailsList));
        favouriteItemDetailsList.clear();
      }
  }
}

class FavouriteDelete extends ChangeNotifier
{
  String favouriteDelProductCode = "";
  favDel({required favouriteDelProductCode}) {
    for (int i = 0; i < FavouritePageDetails.favouriteList.length; i++) {
      if (FavouritePageDetails.favouriteList[i][0].contains(
          this.favouriteDelProductCode))
      {
        FavouritePageDetails.favouriteList.removeAt(i);
        break;
      }
    }
    notifyListeners();
  }
}