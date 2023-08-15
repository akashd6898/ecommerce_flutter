import 'package:ecommerce/checkout_page/checkout_page.dart';
import 'package:ecommerce/favorite_page/favourite_page.dart';
import 'package:ecommerce/favorite_page/favourite_page_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page/home_page.dart';
import 'login_page/login_page.dart';
import 'routes/routes.dart';
import 'package:ecommerce/checkout_page/checkout_page_details.dart';


void main() {
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Price()),
      ChangeNotifierProvider(create: (context) => FavouriteDelete())
  ],
      child: const MyApp()));
  /*ChangeNotifierProvider(create: (context) => Price(),*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      //initialRoute: MyRoutes.checkoutpage,
      routes: {
        MyRoutes.loginpage: (context) => const LoginPage(),
        MyRoutes.homepage: (context) => const HomePage(),
        MyRoutes.checkoutpage: (context) => const CheckoutPage(),
        MyRoutes.favouritespage: (context) => const Favourites()
      });
  }
}