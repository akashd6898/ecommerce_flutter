import 'package:ecommerce/checkout_page/checkout_page.dart';
import 'package:ecommerce/checkout_page/checkout_page_details.dart';
import 'package:ecommerce/favorite_page/favourite_page_details.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  dynamic productDetails;
  ProductPage({Key? key, required this.productDetails}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final priceObj = Provider.of<Price>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Product"),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Brand: ${widget.productDetails.brand}",
            style: const TextStyle(
              fontSize: 18,
            ),
            ),
            Text("Model: ${widget.productDetails.model}",
                style: const TextStyle(
                  fontSize: 18,
                )
            ),
            Padding(
              padding:const EdgeInsets.all(5.0),
              child: SizedBox(
                height: 350,
                width: double.infinity,
                child: PageView.builder(itemCount: widget.productDetails.imageSet?.length,
                    itemBuilder: (context,index)
                {
                  return Image(image: NetworkImage(widget.productDetails.imageSet![index]),
                      fit: BoxFit.contain,
                      width: 300,
                      height: 200,);
                }),
              ),
            ),
            Text("Price: ₹${widget.productDetails.price}",
                style: const TextStyle(
                  fontSize: 18,
                )
            ),
            Text("Color: ${widget.productDetails.color}",
                style: const TextStyle(
                  fontSize: 18,
                )
            ),
            Text("Description: ${widget.productDetails.description}",
                style: const TextStyle(
                  fontSize: 18,
                )),
             Padding(padding: const EdgeInsets.all(15.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                  ElevatedButton(onPressed: ()
                 {
                 CheckoutPageDetails(checkoutProductCode: widget.productDetails.itemCode,
                 checkoutProductImage: widget.productDetails.image,
                 checkoutProductModel: widget.productDetails.model,
                 checkoutProductPrice: widget.productDetails.price);
                 priceObj.priceAdd(widget.productDetails.price);
                 },
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
                 ElevatedButton(
                     onPressed: ()
                     {
                       FavouritePageDetails(favouriteProductCode: widget.productDetails.itemCode,
                           favouriteProductImage: widget.productDetails.image,
                           favouriteProductModel: widget.productDetails.model,
                           favouriteProductPrice: widget.productDetails.price,
                           favouriteProductDescription: widget.productDetails.description
                       );
                     },
                     style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(
                             Colors.blue
                         ),
                         fixedSize: MaterialStateProperty.all<Size>(const Size(150, 50)),
                         elevation: MaterialStateProperty.all(5)
                     ),
                     child:
                     Icon(
                         Icons.favorite,
                         color: Colors.pink[200],
                     ))]
             )),
          ]),
      ),
        bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          backgroundColor: Colors.blue,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          onTap:(index){
            if(index == 0)
              {
                Navigator.pushNamed(context, MyRoutes.homepage);
              }
            if(index == 1)
            {
              Navigator.pushNamed(context, MyRoutes.checkoutpage);
            }
            if(index == 2)
            {
              Navigator.pushNamed(context, MyRoutes.favouritespage);
            }
          },
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home_sharp,
            size: 30,
              ),
                label: "Home",
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,
                size: 30),
                label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp,
                size: 30,
                color: Colors.pink[200]),
                label: "Wishlist")
          ],)
      );
  }
}

